import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
  private var initialLink: String?
  private var eventSink: FlutterEventSink?
  
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    
    // Setup method channels for deep linking
    setupMethodChannels(controller: controller)
    
    // Handle initial URL if app was launched from a deep link
    if let url = launchOptions?[.url] as? URL {
      handleIncomingLink(url.absoluteString)
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  // Handle custom URL schemes (gagcars://)
  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    handleIncomingLink(url.absoluteString)
    return true
  }
  
  // Handle universal links (https://gagcars.com)
  override func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
    if let url = userActivity.webpageURL {
      handleIncomingLink(url.absoluteString)
      return true
    }
    return false
  }
  
  private func handleIncomingLink(_ link: String) {
    print("🎯 Handling deep link: \(link)")
    
    // Store the initial link for when Flutter requests it
    initialLink = link
    
    // Send to Flutter if there's an active event sink
    eventSink?(link)
  }
  
  private func setupMethodChannels(controller: FlutterViewController) {
    // Method Channel for getting initial link
    let methodChannel = FlutterMethodChannel(
      name: "com.gagcars/deeplink",
      binaryMessenger: controller.binaryMessenger
    )
    
    methodChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
      switch call.method {
      case "getInitialLink":
        // Return the initial link and clear it
        result(self?.initialLink)
        self?.initialLink = nil
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    
    // Event Channel for listening to incoming links
    let eventChannel = FlutterEventChannel(
      name: "com.gagcars/deeplink_events",
      binaryMessenger: controller.binaryMessenger
    )
    
    eventChannel.setStreamHandler(self)
  }
}

// MARK: - FlutterStreamHandler for Event Channel
extension AppDelegate: FlutterStreamHandler {
  public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
    self.eventSink = events
    return nil
  }
  
  public func onCancel(withArguments arguments: Any?) -> FlutterError? {
    self.eventSink = nil
    return nil
  }
}

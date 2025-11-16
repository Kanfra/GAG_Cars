package com.example.gag_cars_frontend

import android.content.Intent
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.EventChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.gagcars/deeplink"
    private val EVENT_CHANNEL = "com.gagcars/deeplink_events"
    
    private var initialLink: String? = null
    private var eventSink: EventChannel.EventSink? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Handle initial intent
        handleIntent(intent)
        
        setupMethodChannels()
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        handleIntent(intent)
    }

    private fun handleIntent(intent: Intent) {
        val action = intent.action
        val data = intent.dataString
        
        if (Intent.ACTION_VIEW == action && data != null) {
            // Store the deep link
            initialLink = data
            // Send to Flutter if listener is active
            eventSink?.success(data)
            
            // Log for debugging
            android.util.Log.d("DeepLink", "Handled deep link: $data")
        }
    }

    private fun setupMethodChannels() {
        // Method Channel for initial link
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getInitialLink" -> {
                    result.success(initialLink)
                    initialLink = null // Clear after reading
                }
                else -> result.notImplemented()
            }
        }

        // Event Channel for incoming links
        EventChannel(flutterEngine!!.dartExecutor.binaryMessenger, EVENT_CHANNEL).setStreamHandler(
            object : EventChannel.StreamHandler {
                override fun onListen(args: Any?, events: EventChannel.EventSink) {
                    eventSink = events
                }

                override fun onCancel(args: Any?) {
                    eventSink = null
                }
            }
        )
    }
}
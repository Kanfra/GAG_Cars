# Add basic ProGuard rules for release build
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Keep all Flutter-related classes
-keep class com.gagcars.gordonautogarage.** { *; }

# Keep Google ML Kit classes
-keep class com.google.mlkit.** { *; }

# Keep HTTP and networking classes
-keep class org.apache.** { *; }
-keep class okhttp3.** { *; }
-keep class retrofit2.** { *; }

# Keep JSON serialization classes
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

# Keep annotations
-keepattributes *Annotation*
-keepattributes EnclosingMethod
-keepattributes Signature
-keepattributes InnerClasses

# Keep native methods
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep View getters and setters for XML
-keepclassmembers class * extends android.view.View {
    void set*(***);
    *** get*();
}

# Keep application class
-keep public class * extends android.app.Application

# Don't warn about missing support library classes
-dontwarn android.support.**
-dontwarn com.google.android.gms.**
-dontwarn com.google.ar.sceneform.**

# Common keep rules for Flutter apps
-keep class * extends java.util.ListResourceBundle {
    protected Object[][] getContents();
}

-keep public class * extends android.app.Activity
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider

# ✅ FIX: Add rules for camera and ML Kit dependencies
-keep class com.google.mlkit.vision.** { *; }
-keep class androidx.camera.** { *; }
-keep class com.google.mediapipe.** { *; }

# ✅ FIX: Add rules for Google Play Services
-keep class com.google.android.gms.** { *; }
-keep class com.google.firebase.** { *; }

# ✅ FIX: Add rules for payment and webview
-keep class com.google.pay.** { *; }
-keep class io.flutter.plugins.webviewflutter.** { *; }
# Flutter
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.embedding.** { *; }
-dontwarn io.flutter.embedding.**

# Kotlin
-dontwarn kotlin.**
-keep class kotlin.** { *; }
-keepclassmembers class kotlin.** { *; }
-keepclassmembers class **$Companion { *; }

# AndroidX
-keep class androidx.** { *; }
-dontwarn androidx.**

# Other libraries you use
-keep class * { @Keep *; }
-keepclassmembers class * { @Keep *; }
-dontwarn javax.annotation.**

# Prevent obfuscation of classes used in XML layouts
-keepclassmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}

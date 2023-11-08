package com.example.flutter_method_channel_example

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val CHANNEL = "flutter.example.dev/counter"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "incrementCounter") {
                var count  = call.argument<Int>("counter")?.toInt() ?: 0
                count++
                result.success(count)
            } else {
                result.notImplemented()
            }
        }
    }
}

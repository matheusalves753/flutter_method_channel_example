import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
      let channel = FlutterMethodChannel(name: "flutter.example.dev/counter", binaryMessenger: controller.binaryMessenger)
      
      channel.setMethodCallHandler { call, result in
          if call.method == "incrementCounter" {
              if let args = call.arguments as? [String: Any] {
                  var count = args["counter"] as? Int ?? 0
                  count += 1
                  result(count)
              } else {
                  result(0)
              }
          } else {
              result(FlutterMethodNotImplemented)
          }
      }
      
      GeneratedPluginRegistrant.register(with: self)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

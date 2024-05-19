import UIKit
import Flutter
import GoogleMaps



@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

      GMSServices.provideAPIKey("AIzaSyCct6Mn9T-U4-wclBHsL7mx2hp1JII8kkA")

      GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

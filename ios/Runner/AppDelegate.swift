import UIKit
import Flutter
import TikTokOpenSDKCore


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {    
    GeneratedPluginRegistrant.register(with: self)
      
      let controller = window?.rootViewController as! FlutterViewController
      let api = PigeonApiImplementation()
      ExampleHostApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: api)

    // TikTokOpenSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

   // Add this function
  override func application(
      _ app: UIApplication,
      open url: URL,
      options: [UIApplication.OpenURLOptionsKey: Any] = [:]
  ) -> Bool {
      if TikTokURLHandler.handleOpenURL(url) {
          return true
      }
      return false
  }
  
  // Add this function
  override func application(
      _ application: UIApplication,
      continue userActivity: NSUserActivity,
      restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void
  ) -> Bool {
      if (TikTokURLHandler.handleOpenURL(userActivity.webpageURL)) {
          return true
      }
      return false
  }

    // override  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    //    TikTokOpenSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    //    return true
    // }

    // override  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {

    //     guard let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
    //           let annotation = options[UIApplication.OpenURLOptionsKey.annotation] else {
    //         return false
    //     }

    //     if TikTokOpenSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: sourceApplication, annotation: annotation) {
    //         return true
    //     }
    //     return false
    // }

    // override  func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
    //     if TikTokOpenSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation) {
    //         return true
    //     }
    //     return false
    // }

    // override  func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
    //     if TikTokOpenSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: nil, annotation: "") {
    //         return true
    //     }
    //     return false
    // }  
}

// This extension of Error is required to do use FlutterError in any Swift code.
extension FlutterError: Error {}

private class PigeonApiImplementation: ExampleHostApi {
  func getHostLanguage() throws -> String {
    return "Swift"
  }

  func add(_ a: Int64, to b: Int64) throws -> Int64 {
    if (a < 0 || b < 0) {
      throw FlutterError(code: "code", message: "message", details: "details");
    }
    return a + b
  }

  func sendMessage(message: MessageData, completion: @escaping (Result<Bool, Error>) -> Void) {
    if (message.code == Code.one) {
      completion(.failure(FlutterError(code: "code", message: "message", details: "details")))
      return
    }
    completion(.success(true))
  }
}

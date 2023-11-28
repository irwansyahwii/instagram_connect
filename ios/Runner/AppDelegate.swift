import UIKit
import Flutter

import TikTokOpenAuthSDK
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
      
      let tiktokApi = TiktokSDKApiImplementation(controller:  window!.rootViewController!);
      TiktokSDKApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: tiktokApi)
      

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
//   override func application(_ app: UIApplication,open url: URL,
//                         options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
////            if (TikTokURLHandler.handleOpenURL(url)) {
////                return true
////            }
//            return true
//        }
    
//    override func application(_ application: UIApplication,
//                         continue userActivity: NSUserActivity,
//                         restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
////            if (TikTokURLHandler.handleOpenURL(userActivity.webpageURL)) {
////                return true
////            }
//            return true
//        }

    
    
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


private class TiktokSDKApiImplementation : TiktokSDKApi {
    private var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func setup(clientKey: String, completion: @escaping (Result<Void, Error>) -> Void) {
        
        
        completion(.success(Void()))
    }
    
    func login(permissions: [String], redirectUri: String, browserAuthEnabled: Bool?, completion: @escaping (Result<TikTokLoginResult, Error>) -> Void) {
    
        let authRequest = TikTokAuthRequest(scopes: Set(permissions),
                                            redirectURI: redirectUri)
        /* Step 2 */
        authRequest.send { response in
            /* Step 3 */
            let authResponse = response as? TikTokAuthResponse;
            
            if authResponse?.errorCode == .noError {
                
//                print("Auth code: \(String(describing: authResponse?.authCode))")
                
//                completion(Result.success(TikTokLoginResult(status: TikTokLoginStatus.success, grantedPermissions: authResponse?.grantedPermissions, scopeName: "")))
                
//                completion(.success(
//                    TikTokLoginResult(status: TikTokLoginStatus.success, grantedPermissions: authResponse?.grantedPermissions, scopeName: "")))
                
            } else {
                print("Authorization Failed! error: \(String(describing: authResponse?.error)), error desc: \(String(describing: authResponse?.description))")
                    
//                completion(.failure(authResponse?.description))
            }
            
        }

    }
    
    
}

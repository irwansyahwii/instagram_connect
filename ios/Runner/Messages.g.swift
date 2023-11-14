// Autogenerated from Pigeon (v13.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)"
  ]
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

enum Code: Int {
  case one = 0
  case two = 1
}

enum TikTokLoginStatus: Int {
  case success = 0
  case cancelled = 1
  case error = 2
}

/// https://developers.tiktok.com/doc/tiktok-api-scopes/
enum TikTokPermissionType: Int {
  case researchAdlibBasic = 0
}

/// Generated class from Pigeon that represents data sent in messages.
struct MessageData {
  var name: String? = nil
  var description: String? = nil
  var code: Code
  var data: [String?: String?]

  static func fromList(_ list: [Any?]) -> MessageData? {
    let name: String? = nilOrValue(list[0])
    let description: String? = nilOrValue(list[1])
    let code = Code(rawValue: list[2] as! Int)!
    let data = list[3] as! [String?: String?]

    return MessageData(
      name: name,
      description: description,
      code: code,
      data: data
    )
  }
  func toList() -> [Any?] {
    return [
      name,
      description,
      code.rawValue,
      data,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct Permission {
  var name: String

  static func fromList(_ list: [Any?]) -> Permission? {
    let name = list[0] as! String

    return Permission(
      name: name
    )
  }
  func toList() -> [Any?] {
    return [
      name,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct TikTokLoginResult {
  var status: TikTokLoginStatus
  var authCode: String? = nil
  var state: String? = nil
  var codeVerifier: String? = nil
  var grantedPermissions: [Permission?]
  var errorCode: String? = nil
  var errorMessage: String? = nil

  static func fromList(_ list: [Any?]) -> TikTokLoginResult? {
    let status = TikTokLoginStatus(rawValue: list[0] as! Int)!
    let authCode: String? = nilOrValue(list[1])
    let state: String? = nilOrValue(list[2])
    let codeVerifier: String? = nilOrValue(list[3])
    let grantedPermissions = list[4] as! [Permission?]
    let errorCode: String? = nilOrValue(list[5])
    let errorMessage: String? = nilOrValue(list[6])

    return TikTokLoginResult(
      status: status,
      authCode: authCode,
      state: state,
      codeVerifier: codeVerifier,
      grantedPermissions: grantedPermissions,
      errorCode: errorCode,
      errorMessage: errorMessage
    )
  }
  func toList() -> [Any?] {
    return [
      status.rawValue,
      authCode,
      state,
      codeVerifier,
      grantedPermissions,
      errorCode,
      errorMessage,
    ]
  }
}

private class ExampleHostApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return MessageData.fromList(self.readValue() as! [Any?])
      default:
        return super.readValue(ofType: type)
    }
  }
}

private class ExampleHostApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? MessageData {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class ExampleHostApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return ExampleHostApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return ExampleHostApiCodecWriter(data: data)
  }
}

class ExampleHostApiCodec: FlutterStandardMessageCodec {
  static let shared = ExampleHostApiCodec(readerWriter: ExampleHostApiCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol ExampleHostApi {
  func getHostLanguage() throws -> String
  func add(_ a: Int64, to b: Int64) throws -> Int64
  func sendMessage(message: MessageData, completion: @escaping (Result<Bool, Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class ExampleHostApiSetup {
  /// The codec used by ExampleHostApi.
  static var codec: FlutterStandardMessageCodec { ExampleHostApiCodec.shared }
  /// Sets up an instance of `ExampleHostApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: ExampleHostApi?) {
    let getHostLanguageChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.instagram_connect.ExampleHostApi.getHostLanguage", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getHostLanguageChannel.setMessageHandler { _, reply in
        do {
          let result = try api.getHostLanguage()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getHostLanguageChannel.setMessageHandler(nil)
    }
    let addChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.instagram_connect.ExampleHostApi.add", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      addChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let aArg = args[0] is Int64 ? args[0] as! Int64 : Int64(args[0] as! Int32)
        let bArg = args[1] is Int64 ? args[1] as! Int64 : Int64(args[1] as! Int32)
        do {
          let result = try api.add(aArg, to: bArg)
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      addChannel.setMessageHandler(nil)
    }
    let sendMessageChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.instagram_connect.ExampleHostApi.sendMessage", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      sendMessageChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let messageArg = args[0] as! MessageData
        api.sendMessage(message: messageArg) { result in
          switch result {
            case .success(let res):
              reply(wrapResult(res))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      sendMessageChannel.setMessageHandler(nil)
    }
  }
}
private class TiktokSDKApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return Permission.fromList(self.readValue() as! [Any?])
      case 129:
        return TikTokLoginResult.fromList(self.readValue() as! [Any?])
      default:
        return super.readValue(ofType: type)
    }
  }
}

private class TiktokSDKApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? Permission {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else if let value = value as? TikTokLoginResult {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class TiktokSDKApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return TiktokSDKApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return TiktokSDKApiCodecWriter(data: data)
  }
}

class TiktokSDKApiCodec: FlutterStandardMessageCodec {
  static let shared = TiktokSDKApiCodec(readerWriter: TiktokSDKApiCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol TiktokSDKApi {
  func setup(clientKey: String, completion: @escaping (Result<Void, Error>) -> Void)
  func login(permissions: [TikTokPermissionType], redirectUri: String, browserAuthEnabled: Bool?, completion: @escaping (Result<TikTokLoginResult, Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class TiktokSDKApiSetup {
  /// The codec used by TiktokSDKApi.
  static var codec: FlutterStandardMessageCodec { TiktokSDKApiCodec.shared }
  /// Sets up an instance of `TiktokSDKApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: TiktokSDKApi?) {
    let setupChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.instagram_connect.TiktokSDKApi.setup", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      setupChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let clientKeyArg = args[0] as! String
        api.setup(clientKey: clientKeyArg) { result in
          switch result {
            case .success:
              reply(wrapResult(nil))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      setupChannel.setMessageHandler(nil)
    }
    let loginChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.instagram_connect.TiktokSDKApi.login", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      loginChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let permissionsArg = args[0] as! [TikTokPermissionType]
        let redirectUriArg = args[1] as! String
        let browserAuthEnabledArg: Bool? = nilOrValue(args[2])
        api.login(permissions: permissionsArg, redirectUri: redirectUriArg, browserAuthEnabled: browserAuthEnabledArg) { result in
          switch result {
            case .success(let res):
              reply(wrapResult(res))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      loginChannel.setMessageHandler(nil)
    }
  }
}

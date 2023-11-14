import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(  
   dartOut: 'lib/src/messages.g.dart',
  dartOptions: DartOptions(),
  cppOptions: CppOptions(namespace: 'pigeon_example'),
  cppHeaderOut: 'windows/runner/messages.g.h',
  cppSourceOut: 'windows/runner/messages.g.cpp',
  kotlinOut:
      'android/app/src/main/kotlin/dev/flutter/pigeon_example_app/Messages.g.kt',
  kotlinOptions: KotlinOptions(),
  javaOut: 'android/app/src/main/java/io/flutter/plugins/Messages.java',
  javaOptions: JavaOptions(),
  swiftOut: 'ios/Runner/Messages.g.swift',
  swiftOptions: SwiftOptions(),
  objcHeaderOut: 'macos/Runner/messages.g.h',
  objcSourceOut: 'macos/Runner/messages.g.m',
  // Set this to a unique prefix for your plugin or application, per Objective-C naming conventions.
  objcOptions: ObjcOptions(prefix: 'PGN'),
  // copyrightHeader: 'pigeons/copyright.txt',
  dartPackageName: 'instagram_connect',
))

enum Code { one, two }

class MessageData {
  MessageData({required this.code, required this.data});
  String? name;
  String? description;
  Code code;
  Map<String?, String?> data;
}

@HostApi()
abstract class ExampleHostApi {
  String getHostLanguage();

  // These annotations create more idiomatic naming of methods in Objc and Swift.
  @ObjCSelector('addNumber:toNumber:')
  @SwiftFunction('add(_:to:)')
  int add(int a, int b);

  @async
  bool sendMessage(MessageData message);
}

class Permission{
  final String name;

  Permission(this.name);
}

class TikTokLoginResult {
  const TikTokLoginResult({
    required this.status,
    this.authCode,
    this.state,
    this.codeVerifier,
    this.errorCode,
    this.errorMessage,
    this.grantedPermissions = const [],
  });
  final TikTokLoginStatus status;
  final String? authCode;
  final String? state;
  final String? codeVerifier;
  final List<Permission?> grantedPermissions;
  final String? errorCode;
  final String? errorMessage;

  // @override
  // String toString() {
  //   return 'TikTokLoginResult{status: $status, authCode: $authCode, codeVerifier: $codeVerifier state: $state, grantedPermissions: $grantedPermissions, errorCode: $errorCode, errorMessage: $errorMessage}';
  // }
}

enum TikTokLoginStatus {
  success,
  cancelled,
  error
}

/// https://developers.tiktok.com/doc/tiktok-api-scopes/
enum TikTokPermissionType {
  
  /// Access to public commercial data for research purposes
  researchAdlibBasic('research.adlib.basic'),

  /// Access to TikTok public data for research purposes
  researchDataBasic('research.data.basic'),

  /// Read a user's profile info (open id, avatar, display name ...)
  userInfoBasic('user.info.basic'),

  /// Read access to profile_web_link, profile_deep_link, bio_description, is_verified.
  userInfoProfile('user.info.profile'),

  /// Read access to a user's statistical data, such as likes count, follower count, following count, and video count
  userInfoStats('user.info.stats'),

  /// Read the user's in app communication settings (currently only DM settings are supported)
  userSettingList('user.setting.list'),

  /// Update the user's in app communication settings (currently only DM settings are supported)
  userSettingsUpdate('user.settings.update'),

  /// Read a user's public videos on TikTok
  videoList('video.list'),

  /// Directly post videos to a user's TikTok profile.
  videoPublish('video.publish'),

  /// Share videos to the creator's account as a draft to further edit and post in TikTok.
  videoUpload('video.upload');

  final String scopeName;

  const TikTokPermissionType(this.scopeName);
}

// TikTokPermissionType? _fromScopeName(String scopeName) {
//   switch (scopeName) {
//     case 'research.adlib.basic':
//       return TikTokPermissionType.researchAdlibBasic;
//     case 'research.data.basic':
//       return TikTokPermissionType.researchDataBasic;
//     case 'user.info.basic':
//       return TikTokPermissionType.userInfoBasic;
//     case 'user.info.profile':
//       return TikTokPermissionType.userInfoProfile;
//     case 'user.info.stats':
//       return TikTokPermissionType.userInfoStats;
//     case 'user.setting.list':
//       return TikTokPermissionType.userSettingList;
//     case 'user.settings.update':
//       return TikTokPermissionType.userSettingsUpdate;
//     case 'video.list':
//       return TikTokPermissionType.videoList;
//     case 'video.publish':
//       return TikTokPermissionType.videoPublish;
//     case 'video.upload':
//       return TikTokPermissionType.videoUpload;
//     default:
//       return null;
//   }
// }




@HostApi()
abstract class TiktokSDKApi {
  @async
  void setup(String clientKey);

  @async
  TikTokLoginResult login(
    List<String> permissions,
    String redirectUri,
    bool? browserAuthEnabled    
  );
}
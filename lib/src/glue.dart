
import 'package:com.ice.instagramconnect/src/messages.g.dart';

final ExampleHostApi _api = ExampleHostApi();

/// Calls host method `add` with provided arguments.
Future<int> add(int a, int b) async {
  try {
    return await _api.add(a, b);
  } catch (e) {
    // handle error.
    return 0;
  }
}

/// Sends message through host api using `MessageData` class
/// and api `sendMessage` method.
Future<bool> sendMessage(String messageText) {
  final MessageData message = MessageData(
    code: Code.one,
    data: <String?, String?>{'header': 'this is a header'},
    description: 'uri text',
  );
  try {
    return _api.sendMessage(message);
  } catch (e) {
    // handle error.
    return Future<bool>(() => true);
  }
}

final TiktokSDKApi _tiktokSDKApi = TiktokSDKApi();

Future<void> setupTiktokSDK() async {
  try {
    await _tiktokSDKApi.setup('awuq84d134acknn2');
  } catch (e) {
    print(e);
  }
}

Future<TikTokLoginResult> loginTiktok(List<String> permissions,
  String redirectUri,
  bool? browserAuthEnabled) async {
  try {
    final result = await _tiktokSDKApi.login(permissions, redirectUri, browserAuthEnabled);
    return result;
  } catch (e) {
    print(e);

    return TikTokLoginResult(status: TikTokLoginStatus.error, grantedPermissions: [], scopeName: "");
  }

}
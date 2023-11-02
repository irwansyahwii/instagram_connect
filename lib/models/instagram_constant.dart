class InstagramConstant {
  static InstagramConstant? _instance;
  static InstagramConstant get instance {
    _instance ??= InstagramConstant._init();
    return _instance!;
  }

  InstagramConstant._init();

// FACEBOOK_CLIENT_ID=856380469125896
// FACEBOOK_CLIENT_SECRET=25598d275806cf2d02a1402b76b8ebd5

  String accessToken = "";

  static const String clientID = '856380469125896'; //'718353975697969';
  static const String appSecret =  '25598d275806cf2d02a1402b76b8ebd5'; //'5497481e4a4ab34ae4fc2eeb4e6b7dba';
  static const String redirectUri = 'https://pi3wrvhm6e.ap-southeast-1.awsapprunner.com/';//'https://cpeqah8x3a.ap-southeast-1.awsapprunner.com/'; //'https://www.ekspar.com.tr/';
  static const String scope = 'user_profile,user_media';
  static const String responseType = 'code';
  final String url =
      'https://pi3wrvhm6e.ap-southeast-1.awsapprunner.com/auth/facebook';
}
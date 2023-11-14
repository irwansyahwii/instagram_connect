import 'package:flutter/material.dart';
import 'package:instagram_connect/models/instagram_constant.dart';
import 'package:instagram_connect/src/glue.dart';
import 'package:instagram_connect/src/messages.g.dart';
// import 'package:tiktok_sdk_v2/tiktok_sdk_v2.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatelessWidget {

  Widget instaLoginButton(BuildContext context){
    return ElevatedButton(onPressed: () {        
        // Get.offNamed('instagram');
        launchUrl(Uri.parse(InstagramConstant.instance.url), mode: LaunchMode.externalApplication);
      }, child: const Text('Login to Instagram'),);
  }

  Widget tiktokLoginButton(BuildContext context){
    return ElevatedButton(onPressed: () async {    
      try {
          // final result = await add(100, 200);
          // print('result: $result');

        // final result =  await TikTokSDK.instance.login(permissions: {
        //     TikTokPermissionType.userInfoBasic            
        //     }, browserAuthEnabled: true, redirectUri: "https://www.ice.id");

        final result = await loginTiktok(["user.info.basic"], "ice://login", false);

        print(result);
        
      } catch (e) {
        print(e);        
      }    
      // final loginResult =  await TikTokSDK.instance.login(permissions: {
      //   TikTokPermissionType.userInfoProfile
      // });
      // print(loginResult);
    }, child: const Text('Login to Tiktok'),);

      
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: Column(children: [
        instaLoginButton(context),
        tiktokLoginButton(context)
      ],)),)
    );
  }

}
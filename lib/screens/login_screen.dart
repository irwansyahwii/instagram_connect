import 'dart:io';

import 'package:com.ice.instagramconnect/controllers/login_screen_controller.dart';
import 'package:com.ice.instagramconnect/models/instagram_constant.dart';
import 'package:com.ice.instagramconnect/src/glue.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatelessWidget {

  final LoginScreenController controller = LoginScreenController();

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

  Widget uploadImageButton(BuildContext context){
    return ElevatedButton(onPressed: () {
      
    }, child: const Text('Upload Image...'));
  }

  Widget selectedImage(BuildContext context){
    if(controller.loginScreenModel.value.selectedImagePath == null){
      return Container(
                        decoration: BoxDecoration(
                            color: Colors.red[200]),
                        width: 200,
                        height: 200,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      );
    }else{
      return Image.file(File(controller.loginScreenModel.value.selectedImagePath!), width: 200, height: 200, fit: BoxFit.fitHeight,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: Column(children: [
        instaLoginButton(context),
        tiktokLoginButton(context),
        uploadImageButton(context)
      ],)),)
    );
  }

}
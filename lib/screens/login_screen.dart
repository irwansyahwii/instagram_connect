import 'package:flutter/material.dart';
import 'package:instagram_connect/models/instagram_constant.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(onPressed: () {        
        // Get.offNamed('instagram');
        launchUrl(Uri.parse(InstagramConstant.instance.url), mode: LaunchMode.externalApplication);
      }, child: const Text('Login to Instagram'),)),
    );
  }

}
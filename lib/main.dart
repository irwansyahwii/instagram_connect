import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:instagram_connect/instagram_model.dart';
import 'package:instagram_connect/instagram_view.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: 'login',
    getPages: [
      GetPage(name: '/login', page: () => LoginScreen(),),
      GetPage(name: '/home', page: () => Home(),),
      GetPage(name: '/instagram', page: () => const InstagramView(),)
    ],
  ));
}


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(onPressed: () {        
        Get.offNamed('instagram');
      }, child: const Text('Login to Instagram'),)),
    );
  }

}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(onPressed: () async{
        await InstagramModel().getUserProfile();
        
      }, child: Text('Login')),),
    );
  }

}




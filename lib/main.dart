import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:instagram_connect/controllers/instagram_insights_controller.dart';
import 'package:instagram_connect/models/instagram_constant.dart';
import 'package:instagram_connect/instagram_view.dart';
import 'package:instagram_connect/providers/instagram_insights_provider.dart';
import 'package:instagram_connect/providers/instagram_user_provider.dart';
import 'package:instagram_connect/screens/home.dart';
import 'package:instagram_connect/screens/instagram_insights.dart';
import 'package:instagram_connect/screens/login_screen.dart';
import 'package:uni_links/uni_links.dart';
void main() {
  runApp(GetMaterialApp(
    onInit: () async{
      await initUniLinks();
    },
    initialRoute: 'login',
    initialBinding: BindingsBuilder(() {
      Get.put<InstagramInsightsProvider>(InstagramInsightsProvider());
      Get.put<InstagramUserProvider>(InstagramUserProvider());
    }),
    getPages: [
      GetPage(name: '/login', page: () => LoginScreen(),),
      GetPage(name: '/home', page: () => Home(),),
      GetPage(name: '/instagram', page: () => const InstagramView(),),
      GetPage(name: '/instagram-insights', page: () => InstagramInsights(), binding: BindingsBuilder(() {
        Get.put<InstagramInsightsController>(InstagramInsightsController());        
      },) )
    ],
  ));
}

Future<void> initUniLinks() async {
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    final initialLink = await getInitialLink();

    linkStream.listen((String? link) {
      if(link != null){
        if(link.startsWith("ice://ice-connect?access_token")){
          final token = link.replaceAll("ice://ice-connect?access_token=", "");

          InstagramConstant.instance.accessToken = token;

          Get.offNamed("instagram-insights");

          print('Token: $token');
        }
      }
      
    // Parse the link and warn the user, if it is not correct
    }, onError: (err) {
      print(err);
    // Handle exception by warning the user their action did not succeed
    });
    // Parse the link and warn the user, if it is not correct,
    // but keep in mind it could be `null`.
  } on PlatformException {
    // Handle exception by warning the user their action did not succeed
    // return?
  }
}
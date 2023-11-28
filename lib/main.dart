import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:com.ice.instagramconnect/cloudinary_context.dart';
import 'package:com.ice.instagramconnect/controllers/instagram_insights_controller.dart';
import 'package:com.ice.instagramconnect/controllers/login_screen_controller.dart';
import 'package:com.ice.instagramconnect/instagram_view.dart';
import 'package:com.ice.instagramconnect/models/instagram_constant.dart';
import 'package:com.ice.instagramconnect/providers/instagram_insights_provider.dart';
import 'package:com.ice.instagramconnect/providers/instagram_user_provider.dart';
import 'package:com.ice.instagramconnect/screens/home.dart';
import 'package:com.ice.instagramconnect/screens/instagram_insights.dart';
import 'package:com.ice.instagramconnect/screens/login_screen.dart';
import 'package:com.ice.instagramconnect/src/glue.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';
void main() async {
  
  runApp(GetMaterialApp(
    onInit: () async{
      // TikTokSDK.instance.setup(clientKey: 'awuq84d134acknn2');
      await setupTiktokSDK();

      await initUniLinks();

    },
    initialRoute: 'login',
    initialBinding: BindingsBuilder(() {
      Get.put<InstagramInsightsProvider>(InstagramInsightsProvider());
      Get.put<InstagramUserProvider>(InstagramUserProvider());
    }),
    getPages: [
      GetPage(name: '/login', page: () => LoginScreen(), binding: BindingsBuilder(() {
        Get.put<LoginScreenController>(LoginScreenController());        
      },)),
      GetPage(name: '/login-callback', page: () => Home(),),
      GetPage(name: '/home', page: () => Home(),),
      GetPage(name: '/instagram', page: () => const InstagramView(),),
      GetPage(name: '/instagram-insights', page: () => InstagramInsights(), binding: BindingsBuilder(() {
        Get.put<InstagramInsightsController>(InstagramInsightsController());        
      },) )
    ],
  ));
}

Future<void> initCloudinary() async {  
  CloudinaryContext.cloudinary = Cloudinary.fromCloudName(cloudName: 'dn5lbtiuy');
}

Future<void> initUniLinks() async {
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {

    final initialLink = await getInitialLink();
    final uri = await getInitialUri();

    linkStream.listen((String? link) {
      if(link != null){
        if(link.startsWith("ice://ice-connect?access_token")){
          final token = link.replaceAll("ice://ice-connect?access_token=", "");

          InstagramConstant.instance.accessToken = token;

          Get.offNamed("instagram-insights");

          print('Token: $token');
        }
      }
      
    uriLinkStream.listen((Uri? uri) {
      // Use the uri and warn the user, if it is not correct
      if(uri != null){

      }
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
    });      
      
    // Parse the link and warn the user, if it is not correct
    }, onError: (err) {
      print(err);
    // Handle exception by warning the user their action did not succeed
    });    
  } on PlatformException {
    // Handle exception by warning the user their action did not succeed
    // return?
  }
}
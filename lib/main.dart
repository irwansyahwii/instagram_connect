import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:instagram_connect/instagram_constant.dart';
import 'package:instagram_connect/instagram_model.dart';
import 'package:instagram_connect/instagram_view.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(GetMaterialApp(
    onInit: () async{
      await initUniLinks();
    },
    initialRoute: 'login',
    initialBinding: BindingsBuilder(() {
      Get.put<InstagramInsightsProvider>(InstagramInsightsProvider());
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

class InstagramInsights extends StatelessWidget {
  final InstagramInsightsController controller = Get.find();

  InstagramInsights({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if(controller.screenStatus.value == ScreenStatus.loading){
        controller.getInsights();
        return const Center(child: CircularProgressIndicator(),);
      }else{
        return Center(child: Text(controller.resultString.value),);
      }
      
    },));
    
    
  }

}


enum ScreenStatus {loading, ready}
class InstagramInsightsController extends GetxController {
  Rx<ScreenStatus> screenStatus = ScreenStatus.loading.obs;

  RxString resultString = "".obs;

  final InstagramInsightsProvider instagramInsightsProvider = Get.find();


  Future<void> getInsights() async{
    try{
      screenStatus.value = ScreenStatus.loading;

      // await Future.delayed(const Duration(seconds: 1));
      final meAccounts = await instagramInsightsProvider.getMeAccounts();

      final pageId = meAccounts["data"][0]["id"] ?? "";

      final igUserIdResponse = await instagramInsightsProvider.getIGUserId(pageId);

      final igUserId = igUserIdResponse["instagram_business_account"]["id"];
      final IgUser igUser = await instagramInsightsProvider.getIgUser(igUserId);
      final igUserInsights = await instagramInsightsProvider.getIgUserInsights(igUserId);

      final insightsString = igUserInsights.data.map((e) {
         return '${e.name}: ${e.values[0].value}';
      },).join(",");
      resultString.value = 'username: ${igUser.username}, $insightsString';
      
      print(igUserInsights);

    }finally{
      screenStatus.value = ScreenStatus.ready;
    }
    

  }

}



class InstagramInsightsProvider extends  GetConnect {

  Future<Map<String, dynamic>> getMeAccounts() async {
    final jsonString = await get('https://graph.facebook.com/v18.0/me/accounts?access_token=${InstagramConstant.instance.accessToken}');

    return jsonDecode(jsonString.bodyString ?? "{}");
  }

  Future<Map<String, dynamic>> getIGUserId(String pageId) async {
    final jsonString = await get('https://graph.facebook.com/v18.0/$pageId?fields=instagram_business_account&access_token=${InstagramConstant.instance.accessToken}');

    return jsonDecode(jsonString.bodyString ?? "{}");

  }

  Future<IgUserInsights> getIgUserInsights(String userId) async {
    final jsonString = await get('https://graph.facebook.com/v18.0/$userId/insights?metric=impressions,reach,profile_views&period=day&access_token=${InstagramConstant.instance.accessToken}');

    // return jsonDecode(jsonString.bodyString ?? "{}");

    return IgUserInsights.fromJson(jsonDecode(jsonString.bodyString ?? "{}"));

  }

  Future<IgUser> getIgUser(String userId) async {
    final jsonString = await get('https://graph.facebook.com/v18.0/$userId?fields=biography%2Cid%2Cusername%2Cwebsite&period=day&access_token=${InstagramConstant.instance.accessToken}');

    // return jsonDecode(jsonString.bodyString ?? "{}");

    return IgUser.fromJson(jsonDecode(jsonString.bodyString ?? "{}"));

  }

}

class IgUser {
    String biography;
    String id;
    String username;

    IgUser({
        required this.biography,
        required this.id,
        required this.username,
        
    });

    factory IgUser.fromJson(Map<String, dynamic> json) => IgUser(
        biography: json["biography"],
        id: json["id"],
        username: json["username"],
        
    );

    Map<String, dynamic> toJson() => {
        "biography": biography,
        "id": id,
        "username": username,
        
    };
}


class IgUserInsights {
    List<Datum> data;

    IgUserInsights({
        required this.data,
    });

    factory IgUserInsights.fromJson(Map<String, dynamic> json) => IgUserInsights(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String name;
    String period;
    List<Value> values;
    String title;
    String description;
    String id;

    Datum({
        required this.name,
        required this.period,
        required this.values,
        required this.title,
        required this.description,
        required this.id,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        period: json["period"],
        values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
        title: json["title"],
        description: json["description"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "period": period,
        "values": List<dynamic>.from(values.map((x) => x.toJson())),
        "title": title,
        "description": description,
        "id": id,
    };
}

class Value {
    int value;
    String endTime;

    Value({
        required this.value,
        required this.endTime,
    });

    factory Value.fromJson(Map<String, dynamic> json) => Value(
        value: json["value"],
        endTime: json["end_time"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "end_time": endTime,
    };
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




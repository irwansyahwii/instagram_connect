import 'dart:convert';

import 'package:com.ice.instagramconnect/models/ig_user.dart';
import 'package:com.ice.instagramconnect/models/ig_user_insights.dart';
import 'package:com.ice.instagramconnect/models/instagram_constant.dart';
import 'package:get/get_connect/connect.dart';

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
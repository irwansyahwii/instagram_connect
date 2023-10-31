import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:instagram_connect/models/ig_user.dart';
import 'package:instagram_connect/models/ig_user_insights.dart';
import 'package:instagram_connect/models/instagram_constant.dart';

class InstagramUserProvider extends GetConnect {

  Future<IgUserInsights> getIgUserInsights(String userId) async {
    final jsonString = await get('https://graph.facebook.com/v18.0/$userId/insights?metric=impressions,reach,profile_views,accounts_engaged&period=day&metric_type=total_value&access_token=${InstagramConstant.instance.accessToken}');

    // return jsonDecode(jsonString.bodyString ?? "{}");

    return IgUserInsights.fromJson(jsonDecode(jsonString.bodyString ?? "{}"));

  }

  Future<IgUser> getIgUser(String userId) async {
    List<String> fields = ["biography", "id", "ig_id", "followers_count", "follows_count", "media_count", "name", "profile_picture_url", "username", "website" ];
    final jsonString = await get('https://graph.facebook.com/v18.0/$userId?fields=${fields.join(",")}&access_token=${InstagramConstant.instance.accessToken}');

    // return jsonDecode(jsonString.bodyString ?? "{}");

    Map<String, dynamic> profileMap = jsonDecode(jsonString.bodyString ?? "{}");

    IgUserInsights igUserInsights = await getIgUserInsights(userId);

    igUserInsights.data.forEach((element) {
      profileMap[element.name] = element.totalValue.value;
    });


    return IgUser.fromJson(profileMap);

  }

}
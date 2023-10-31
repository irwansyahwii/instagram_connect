import 'dart:collection';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:instagram_connect/models/data_ids.dart';
import 'package:instagram_connect/models/ig_media.dart';
import 'package:instagram_connect/models/ig_media_insights.dart';
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

  Future<DataIds> getStoriesId(String userId) async {
    final jsonString = await get('https://graph.facebook.com/v18.0/$userId/stories?access_token=${InstagramConstant.instance.accessToken}');

    return DataIds.fromJson(jsonDecode(jsonString.bodyString ?? "{}"));
  }

  Future<IgMediaInsights> getIGMediaInsights(String mediaId) async {
    List<String> storyMetrics = ["exits","impressions", "reach", "replies", "taps_forward", "taps_back"];
    List<String> photoMetrics = ["engagement","impressions", "reach", "saved", "video_views"];

    final combinedMetrics = <String>{};

    storyMetrics.forEach((element) {
      combinedMetrics.add(element);
    });

    photoMetrics.forEach((element) {
      combinedMetrics.add(element);
    });

    
    final jsonString = await get('https://graph.facebook.com/v18.0/$mediaId/insights?metric=${combinedMetrics.toList().join(",")}&access_token=${InstagramConstant.instance.accessToken}');

    Map<String, dynamic> responseMap = jsonDecode(jsonString.bodyString ?? "{}");
    if(responseMap["error"] != null){
      return IgMediaInsights(data: []);
    }else{
      return IgMediaInsights.fromJson(responseMap);
    }
    
  }

  Future<IgMedia> getIGMedia(String mediaId) async {
    List<String> fields = ["like_count", "comments_count", "media_product_type", "media_type", "media_url", "owner", "permalink", "shortcode", "thumbnail_url", "timestamp", "username"];
    Response<dynamic> jsonString = await get('https://graph.facebook.com/v18.0/$mediaId?fields=${fields.join(",")}&access_token=${InstagramConstant.instance.accessToken}');

    Map<String, dynamic> mediaMap = jsonDecode(jsonString.bodyString ?? "{}");

    jsonString = await get('https://graph.facebook.com/v18.0/$mediaId?fields=${fields.join(",")}&access_token=${InstagramConstant.instance.accessToken}');

    IgMediaInsights igMediaInsights = await getIGMediaInsights(mediaId);
    igMediaInsights.data.forEach((element) {
      mediaMap[element.name] = element.totalValue.value;
    });
    return IgMedia.fromJson(mediaMap);
  }

  Future<List<IgMedia>> getStories(String userId) async {

    List<IgMedia> result = [];
    final mediaIds = await getStoriesId(userId);
    for(int i = 0; i < mediaIds.data.length; i++){
      final mediaId = mediaIds.data[i].id;
      IgMedia mediaInfo = await getIGMedia(mediaId);
      result.add(mediaInfo);
    }

    return result;
  }

}
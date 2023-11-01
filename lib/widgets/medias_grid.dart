import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_connect/controllers/instagram_insights_controller.dart';
import 'package:instagram_connect/models/ig_media.dart';

class MediasGrid extends StatelessWidget {
  final RxList<IgMedia> posts;
  MediasGrid({super.key, required this.posts});

  final InstagramInsightsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GridView.count(crossAxisCount: 3,
    mainAxisSpacing: 10,
  
    children: posts.map((e) {
      if(e.mediaUrl != ""){

      return SizedBox(height: MediaQuery.of(context).size.height / 3, width: MediaQuery.of(context).size.width / 3, child: Column(children: [
        Image.network(e.mediaUrl, height: MediaQuery.of(context).size.width / 3 - 90, ),
        Text('likes: ${e.likeCount}'),
        Text('comments: ${e.commentsCount}'),
        Text('shares: ${e.shares}'),
        Text('saved: ${e.saved}'),
        Text('engagement: ${e.engagement}'),
      ],),) ;

      }else{
        controller.getPost(e.id);
        return SizedBox(height: MediaQuery.of(context).size.height / 3, width: MediaQuery.of(context).size.width / 3, child: 
        Center(child: CircularProgressIndicator()),) ;

      }

      // return SizedBox(height: MediaQuery.of(context).size.height / 3, width: MediaQuery.of(context).size.width / 3, child: Column(children: [
      //   Image.network(e.mediaUrl, height: MediaQuery.of(context).size.width / 3 - 90, ),
      //   Text('likes: ${e.likeCount}'),
      //   Text('comments: ${e.commentsCount}'),
      //   Text('shares: ${e.shares}'),
      //   Text('saved: ${e.saved}'),
      //   Text('engagement: ${e.engagement}'),
      // ],),) ;
    }).toList(),);
    });
  }

}
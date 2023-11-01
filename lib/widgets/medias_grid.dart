import 'package:flutter/material.dart';
import 'package:instagram_connect/models/ig_media.dart';

class MediasGrid extends StatelessWidget {
  final List<IgMedia> posts;
  const MediasGrid({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 3,
    mainAxisSpacing: 10,
  
    children: posts.map((e) {
      return SizedBox(height: MediaQuery.of(context).size.height / 3, width: MediaQuery.of(context).size.width / 3, child: Column(children: [
        Image.network(e.mediaUrl, height: MediaQuery.of(context).size.width / 3 - 90, ),
        Text('likes: ${e.likeCount}'),
        Text('comments: ${e.commentsCount}'),
        Text('shares: ${e.shares}'),
        Text('saved: ${e.saved}'),
        Text('engagement: ${e.engagement}'),
      ],),) ;
    }).toList(),);
  }

}
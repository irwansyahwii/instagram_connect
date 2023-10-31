import 'package:flutter/widgets.dart';
import 'package:instagram_connect/models/ig_media.dart';
import 'package:instagram_connect/widgets/story_card.dart';
import 'package:instagram_connect/widgets/story_circle.dart';

class StoriesSection extends StatelessWidget {
  final List<IgMedia> igMedias;

  const StoriesSection({
    super.key,
    required this.igMedias}
  );


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: igMedias.map((e) {
          return StoryCard(igMedia: e);
          // return Padding(padding: const EdgeInsets.all(10), child: StoryCircle(url: e.mediaUrl),);
        },).toList()
,
    ),) ;
  }

}
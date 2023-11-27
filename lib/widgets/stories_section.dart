import 'package:com.ice.instagramconnect/models/ig_media.dart';
import 'package:com.ice.instagramconnect/widgets/story_card.dart';
import 'package:flutter/widgets.dart';

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
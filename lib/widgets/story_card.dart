import 'package:com.ice.instagramconnect/models/ig_media.dart';
import 'package:com.ice.instagramconnect/widgets/story_circle.dart';
import 'package:flutter/widgets.dart';

class StoryCard extends StatelessWidget {
  final IgMedia igMedia;

  const StoryCard({
    super.key,
    required this.igMedia
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      StoryCircle(url: igMedia.mediaUrl,),
      Text('exits: ${igMedia.exits}'),
      Text('replies: ${igMedia.replies}'),
      Text('reach: ${igMedia.reach}'),
      Text('tapsForward: ${igMedia.tapsForward}'),
      Text('tapsBackward: ${igMedia.tapsBackward}'),
      Text('impressions: ${igMedia.impressions}'),
    ],);
  }

}
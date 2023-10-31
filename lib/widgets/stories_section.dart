import 'package:flutter/widgets.dart';
import 'package:instagram_connect/widgets/story_circle.dart';

class StoriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(padding: EdgeInsets.all(10), child: StoryCircle(),),
        Padding(padding: EdgeInsets.all(10), child: StoryCircle(),),
        Padding(padding: EdgeInsets.all(10), child: StoryCircle(),),
        Padding(padding: EdgeInsets.all(10), child: StoryCircle(),),
        Padding(padding: EdgeInsets.all(10), child: StoryCircle(),),
        Padding(padding: EdgeInsets.all(10), child: StoryCircle(),),
      ],
    ),) ;
  }

}
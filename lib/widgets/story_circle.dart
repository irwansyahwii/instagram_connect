import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';


class StoryCircle extends StatefulWidget {
  final String url;

  const StoryCircle({super.key,
    required this.url
    });
    
      @override
      State<StatefulWidget> createState() => _StoryCircleState();

  
}

class _StoryCircleState extends State<StoryCircle> with SingleTickerProviderStateMixin {
  /// Variables
  late Animation gap;
  late Animation<double> base;
  late Animation<double> reverse;
  late AnimationController controller;

  /// Init
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 4));
    base = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    reverse = Tween(begin: 0.0, end: -1.0).animate(base);
    gap = Tween(begin: 3.0, end: 0.0).animate(base)
          ..addListener(() {
              setState(() {});
            });
    controller.forward();
  }

  /// Dispose
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// Widget
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 60, height: 60, child: RotationTransition(

          turns: base,
          child: DashedCircle(

            gapSize: gap.value,
            dashes: 40,
            color: Color(0XFFED4634),
            child: RotationTransition(

              turns: reverse,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircleAvatar(                  
                  radius: 80.0,
                  backgroundImage: NetworkImage(                    
                    widget.url
                  ),
                ),
              ),
            ),
          ),
        ),)  ;
  }
}
               
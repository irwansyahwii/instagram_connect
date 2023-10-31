import 'package:flutter/widgets.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';


class InstaProfilePicture extends StatelessWidget {
  final Uri url;
  final double radius;
  final String name;
  final double fontSize;

  const InstaProfilePicture({super.key, 
    required this.name,
    required this.url,
    this.radius = 31,
    this.fontSize = 21
  });

  @override
  Widget build(BuildContext context) {
    return ProfilePicture(img: url.toString(), radius: radius, fontsize: fontSize, name: name,);
  }

}
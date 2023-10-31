import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:instagram_connect/widgets/insta_profile_picture.dart';
import 'package:instagram_connect/widgets/num_and_text_column.dart';

class ProfileSection extends StatelessWidget {

  final int postsCount;
  final int followers;
  final int following;
  final int impression;
  final int reach;
  final int profileViewed;
  final int engagement;
  final Uri profilePictureUrl;
  final String name;
  final String website;

  const ProfileSection({super.key,
  required this.postsCount,
  required this.followers,
  required this.following,
  required this.impression,
  required this.reach,
  required this.profilePictureUrl,
  required this.name,
  required this.website,
  required this.profileViewed,
  required this.engagement
  });

  Widget firstRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      InstaProfilePicture(
        name: name, 
        url: profilePictureUrl, 
        ),
        NumAndTextColumn(amount: postsCount, unitName: 'Posts'),
        NumAndTextColumn(amount: followers, unitName: 'Followers'),
        NumAndTextColumn(amount: following, unitName: 'Following'),        
    ],);
  }

  Widget secondRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
        NumAndTextColumn(amount: impression, unitName: 'Impression'),
        NumAndTextColumn(amount: reach, unitName: 'Reach'),
        NumAndTextColumn(amount: profileViewed, unitName: 'Profile Viewed'),        
        NumAndTextColumn(amount: engagement, unitName: 'Engagement'),        
    ],);
  }

  Widget thirdRow(){
    return Column(
      children: [
        Text(name),
        Text(website),        
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(10), child: Column(children: [
      firstRow(),
      Padding(padding: EdgeInsets.only(top: 10), child: secondRow(),),
      Padding(padding: EdgeInsets.only(top: 10), child: thirdRow(),),
      
      
    ],),) ;
  }

}
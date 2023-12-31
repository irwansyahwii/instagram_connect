import 'package:com.ice.instagramconnect/controllers/instagram_insights_controller.dart';
import 'package:com.ice.instagramconnect/widgets/medias_grid.dart';
import 'package:com.ice.instagramconnect/widgets/profile_section.dart';
import 'package:com.ice.instagramconnect/widgets/stories_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InstagramInsights extends StatelessWidget {
  final InstagramInsightsController controller = Get.find();

  InstagramInsights({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if(controller.screenStatus.value == ScreenStatus.loading){
        
        return const Center(child: CircularProgressIndicator(),);
      }else{
        return SafeArea(child: SingleChildScrollView(child: Column(
          children: [
            Text(controller.igUser.value.username, style: const TextStyle(fontWeight: FontWeight.bold),),
            ProfileSection(
              profilePictureUrl: Uri.parse(controller.igUser.value.profilePictureUrl),
              name: controller.igUser.value.name,
              website: controller.igUser.value.website,
              followers: controller.igUser.value.followersCount, following: controller.igUser.value.followsCount, postsCount: controller.igUser.value.mediaCount,
            engagement: 0, impression: 0, profileViewed: 0, reach: 0, 
            ),

            StoriesSection(igMedias: controller.igStories.value),
            SizedBox(height: (MediaQuery.of(context).size.height / 3 + 200)* controller.igPosts.length + 2000, width: MediaQuery.of(context).size.width, child: MediasGrid(posts: controller.igPosts),)            
            
          ],
        ),) ); 
      }
      
    },));
    
    
  }

}
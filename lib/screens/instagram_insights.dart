import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_connect/controllers/instagram_insights_controller.dart';
import 'package:instagram_connect/widgets/medias_grid.dart';
import 'package:instagram_connect/widgets/profile_section.dart';
import 'package:instagram_connect/widgets/stories_section.dart';

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
            Text("irwansyahswitch", style: TextStyle(fontWeight: FontWeight.bold),),
            ProfileSection(
              profilePictureUrl: Uri.parse(controller.igUser.value.profilePictureUrl),
              name: controller.igUser.value.name,
              website: controller.igUser.value.website,
              followers: controller.igUser.value.followersCount, following: controller.igUser.value.followsCount, postsCount: controller.igUser.value.mediaCount,
            engagement: 0, impression: 0, profileViewed: 0, reach: 0, 
            ),

            StoriesSection(igMedias: controller.igStories.value),
            SizedBox(height: (MediaQuery.of(context).size.height / 3 + 200)* controller.igPosts.length + 2000, width: MediaQuery.of(context).size.width, child: MediasGrid(posts: controller.igPosts.value),)            
            
          ],
        ),) ); 
      }
      
    },));
    
    
  }

}
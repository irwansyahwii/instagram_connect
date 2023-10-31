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
              profilePictureUrl: Uri.parse("https://user-images.githubusercontent.com/37553901/134119814-8199fe68-cbc7-4a8d-8d4f-4abb16343a80.png"),
              name: "Irwansyah",
              website: "http://www.irwan.com",
              followers: 0, following: 1, postsCount: 4,
            engagement: 0, impression: 0, profileViewed: 0, reach: 0, 
            ),

            StoriesSection(),
            SizedBox(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, child: const MediasGrid(),)            
            
          ],
        ),) ); 
      }
      
    },));
    
    
  }

}
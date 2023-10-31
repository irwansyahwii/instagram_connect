import 'package:get/get.dart';
import 'package:instagram_connect/models/ig_user.dart';
import 'package:instagram_connect/providers/instagram_insights_provider.dart';
import 'package:instagram_connect/providers/instagram_user_provider.dart';

enum ScreenStatus {loading, ready}
class InstagramInsightsController extends GetxController {
  Rx<ScreenStatus> screenStatus = ScreenStatus.loading.obs;

  @override
  void onInit() {    
    super.onInit();

    getInsights();
  }

  RxString resultString = "".obs;
  Rx<IgUser> igUser = IgUser.empty().obs;

  final InstagramInsightsProvider instagramInsightsProvider = Get.find();
  final InstagramUserProvider instagramUserProvider = Get.find();


  Future<void> getInsights() async{
    try{
      screenStatus.value = ScreenStatus.loading;

      // await Future.delayed(const Duration(seconds: 1));
      final meAccounts = await instagramInsightsProvider.getMeAccounts();

      final pageId = meAccounts["data"][0]["id"] ?? "";

      final igUserIdResponse = await instagramInsightsProvider.getIGUserId(pageId);

      final igUserId = igUserIdResponse["instagram_business_account"]["id"];      
      final IgUser igUserValue = await instagramUserProvider.getIgUser(igUserId);
      final igUserInsights = await instagramInsightsProvider.getIgUserInsights(igUserId);

      igUser.update((val) {
        val!.biography = igUserValue.biography;
        val!.id = igUserValue.id;
        val!.username = igUserValue.username;
        val!.profilePictureUrl = igUserValue.profilePictureUrl;
        val!.followersCount = igUserValue.followersCount;
        val!.followsCount = igUserValue.followsCount;
        val!.igId = igUserValue.igId;
        val!.mediaCount = igUserValue.mediaCount;
        val!.name = igUserValue.name;
        val!.username = igUserValue.username;
        val!.website = igUserValue.website;
        val!.engagement = igUserValue.engagement;
        val!.reach = igUserValue.reach;
        val!.profileViewed = igUserValue.profileViewed;
        val!.impression = igUserValue.impression;
      });

      final insightsString = igUserInsights.data.map((e) {
         return '${e.name}: ${e.values[0].value}';
      },).join(",");
      resultString.value = 'username: ${igUserValue.username}, $insightsString';
      
      print(igUserInsights);

    }finally{
      screenStatus.value = ScreenStatus.ready;
    }
    

  }

}
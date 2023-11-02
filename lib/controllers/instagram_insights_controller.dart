import 'package:get/get.dart';
import 'package:instagram_connect/models/ig_media.dart';
import 'package:instagram_connect/models/ig_user.dart';
import 'package:instagram_connect/models/instagram_constant.dart';
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
  RxList<IgMedia> igStories = RxList.empty();
  RxList<IgMedia> igPosts = RxList.empty();

  final InstagramInsightsProvider instagramInsightsProvider = Get.find();
  final InstagramUserProvider instagramUserProvider = Get.find();


  Future<void> getInsights() async{
    try{
      screenStatus.value = ScreenStatus.loading;

      // await Future.delayed(const Duration(seconds: 1));
      final longLiveTokenResponse = await instagramUserProvider.getLongLiveToken();
      InstagramConstant.instance.accessToken = longLiveTokenResponse.accessToken;
      final meAccounts = await instagramInsightsProvider.getMeAccounts();

      final pageId = meAccounts["data"][0]["id"] ?? "";

      final igUserIdResponse = await instagramInsightsProvider.getIGUserId(pageId);

      final igUserId = igUserIdResponse["instagram_business_account"]["id"];      
      final IgUser igUserValue = await instagramUserProvider.getIgUser(igUserId);

      final igStoriesValues = await instagramUserProvider.getStories(igUserId);

      // final igPostsValues = await instagramUserProvider.getPosts(igUserId);
      final igPostsValues = await instagramUserProvider.getPostsPlaceholder(igUserId);

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

      igStories.value = igStoriesValues;

      igPosts.value = igPostsValues;


    }finally{
      screenStatus.value = ScreenStatus.ready;
    }
    

  }

  void getPost(String id) async {
    print("getPost for id: $id");
    IgMedia mediaInfo = await instagramUserProvider.getIGMedia(id);

    print("getPost for id: $id success");

    for(int i = 0; i < igPosts.length; i++){
      if(igPosts[i].id == id){
        igPosts[i] = mediaInfo;
        break;
      }
    }

    igPosts.refresh();
  }

}
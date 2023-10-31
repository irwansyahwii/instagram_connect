import 'package:get/get.dart';
import 'package:instagram_connect/models/ig_user.dart';
import 'package:instagram_connect/providers/instagram_insights_provider.dart';

enum ScreenStatus {loading, ready}
class InstagramInsightsController extends GetxController {
  Rx<ScreenStatus> screenStatus = ScreenStatus.loading.obs;

  @override
  void onInit() {    
    super.onInit();

    getInsights();
  }

  RxString resultString = "".obs;

  final InstagramInsightsProvider instagramInsightsProvider = Get.find();


  Future<void> getInsights() async{
    try{
      screenStatus.value = ScreenStatus.loading;

      // await Future.delayed(const Duration(seconds: 1));
      final meAccounts = await instagramInsightsProvider.getMeAccounts();

      final pageId = meAccounts["data"][0]["id"] ?? "";

      final igUserIdResponse = await instagramInsightsProvider.getIGUserId(pageId);

      final igUserId = igUserIdResponse["instagram_business_account"]["id"];
      final IgUser igUser = await instagramInsightsProvider.getIgUser(igUserId);
      final igUserInsights = await instagramInsightsProvider.getIgUserInsights(igUserId);

      final insightsString = igUserInsights.data.map((e) {
         return '${e.name}: ${e.values[0].value}';
      },).join(",");
      resultString.value = 'username: ${igUser.username}, $insightsString';
      
      print(igUserInsights);

    }finally{
      screenStatus.value = ScreenStatus.ready;
    }
    

  }

}
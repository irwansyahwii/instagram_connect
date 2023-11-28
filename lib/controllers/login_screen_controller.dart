import 'package:com.ice.instagramconnect/models/instagram_constant.dart';
import 'package:com.ice.instagramconnect/models/login_screen_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';

class LoginScreenController extends GetxController  {
  Rx<LoginScreenModel> loginScreenModel = LoginScreenModel().obs;

}
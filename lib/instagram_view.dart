import 'package:com.ice.instagramconnect/screens/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'models/instagram_constant.dart';
import 'instagram_model.dart';

class InstagramView extends StatelessWidget {
  const InstagramView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final webview = FlutterWebviewPlugin();
      final InstagramModel instagram = InstagramModel();

      buildRedirectToHome(webview, instagram, context);

      return WebviewScaffold(

        url: InstagramConstant.instance.url,
        resizeToAvoidBottomInset: true,
        appBar: buildAppBar(context),
      );
    });
  }

  Future<void> buildRedirectToHome(FlutterWebviewPlugin webview,
      InstagramModel instagram, BuildContext context) async {
    webview.onHttpError.listen((event) {
      print(event.code);
    });
    webview.onUrlChanged.listen((String url) async {
      if (url.contains(InstagramConstant.redirectUri)) {
        instagram.getAuthorizationCode(url);
        await instagram.getTokenAndUserID().then((isDone) {
          if (isDone) {
            instagram.getUserProfile().then((isDone) async {
              await webview.close();

              print('${instagram.username} logged in!');

              await Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomeView(
                    followers_count: instagram.followers_count,
                    name: instagram.username.toString(),
                  ),
                ),
              );
            });
          }
        });
      }
    });
  }

  AppBar buildAppBar(BuildContext context) => AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Instagram Login',
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.black),
        ),
      );
}
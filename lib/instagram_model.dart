import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/instagram_constant.dart';

class InstagramModel {
  List<String> userFields = ['id', 'username'];

  String? authorizationCode;
  String? accessToken;
  String? userID;
  String? username;
  int followers_count = 0;

  // String access_token = "IGQWRPdl9GWGRXUTlnbnZAJdnJIOTNfb3NxRjRaeXliY2IxaWhFejBkNGptSzg2WERiaGJjWXJpT3BFblJpWWQ0ajRMN0trN0lodHlyRzM0WVoyTUdaeEViYlp2VEU1ZAGxlTVpNQ1hlejNFNllOTUJWQzhZAV19wbGduX2t6LURvTXZAqdwZDZD";
  // String userid = "23905554212426689";

  void getAuthorizationCode(String url) {
    authorizationCode = url
        .replaceAll('${InstagramConstant.redirectUri}?code=', '')
        .replaceAll('#_', '');
  }



  Future<bool> getTokenAndUserID() async {
    var url = Uri.parse('https://api.instagram.com/oauth/access_token');
    final response = await http.post(url, body: {
      'client_id': InstagramConstant.clientID,
      'redirect_uri': InstagramConstant.redirectUri,
      'client_secret': InstagramConstant.appSecret,
      'code': authorizationCode,
      'grant_type': 'authorization_code'
    });
    accessToken = json.decode(response.body)['access_token'];
    print(accessToken);
    userID = json.decode(response.body)['user_id'].toString();
    return (accessToken != null && userID != null) ? true : false;
  }

  Future<bool> getUserProfile() async {
    final fields = userFields.join(',');
    final responseNode = await http.get(Uri.parse(
        'https://graph.instagram.com/$userID?fields=$fields&access_token=$accessToken'));
    var instaProfile = {
      'id': json.decode(responseNode.body)['id'].toString(),
      'username': json.decode(responseNode.body)['username'],
    };
    username = json.decode(responseNode.body)['username'];
    print('username: $username');

    try {
      const url = "https://pi3wrvhm6e.ap-southeast-1.awsapprunner.com";
      final queryResponse = await http.get(Uri.parse('$url/query?igid=$username'));

      final queryResponseMap = json.decode(queryResponse.body);

      followers_count = queryResponseMap['business_discovery']['followers_count'];
      
    } catch (_) {
      
    }
    

    return instaProfile != null ? true : false;
  }
}
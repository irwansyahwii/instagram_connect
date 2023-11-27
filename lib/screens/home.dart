import 'package:com.ice.instagramconnect/instagram_model.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(onPressed: () async{
        await InstagramModel().getUserProfile();
        
      }, child: Text('Login')),),
    );
  }

}
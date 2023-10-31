import 'package:flutter/material.dart';
import 'package:instagram_connect/instagram_model.dart';

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
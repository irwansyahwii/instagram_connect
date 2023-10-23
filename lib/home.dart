import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key, required this.followers_count, required this.name})
      : super(key: key);
  final int followers_count;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $name'),
      ),
      body: Center(
        child: Text('Followers Count: $followers_count'),
      ),
    );
  }
}
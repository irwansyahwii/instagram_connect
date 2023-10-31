import 'package:flutter/material.dart';

class MediasGrid extends StatelessWidget {
  const MediasGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 3,
    children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          }),);
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/providers/navigation_provider.dart';

class SecondScreen extends StatelessWidget {
  static const route = '/second';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: ListView.builder(
        controller: NavigationProvider.of(context)
            .screens[EXPLORE_SCREEN]
            .scrollController,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item: $index'),
          );
        },
      ),
    );
  }
}

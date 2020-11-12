import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/screens/screens_of_first/pushed_screen.dart';

class FirstScreen extends StatelessWidget {
  static const route = '/first';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.of(
                  context,
                  // BottomNavigationBar ile diğer ekrana git
                  rootNavigator: false,
                ).pushNamed(PushedScreen.route);
              },
              child: Text('BottomNavigationBar ile sayfaya git'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(
                  context,
                  // BottomNavigationBar olmadan diğer ekrana git (Kök dizin)
                  rootNavigator: true,
                ).pushNamed(PushedScreen.route);
              },
              child: Text('BottomNavigationBar olmadan sayfaya git'),
            ),
          ],
        ),
      ),
    );
  }
}

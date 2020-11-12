import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/models/story.dart';
import 'package:flutter_instagram_clone/screens/screens_of_first/pushed_screen.dart';
import 'package:flutter_instagram_clone/widgets/custom_app_bar.dart';
import 'package:flutter_instagram_clone/widgets/circular_border.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreen extends StatelessWidget {
  static const route = '/first';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          Text("Instagram", style: GoogleFonts.satisfy(fontSize: 24)), true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  StoryWidget(Story("lorem","https://source.unsplash.com/300x300")),
                  StoryWidget(Story("ipsum","https://source.unsplash.com/301x300")),
                  StoryWidget(Story("sit","https://source.unsplash.com/302x300")),
                  StoryWidget(Story("dolor","https://source.unsplash.com/303x300")),
                  StoryWidget(Story("amet","https://source.unsplash.com/304x300")),
                  StoryWidget(Story("lorem","https://source.unsplash.com/305x300")),
                  StoryWidget(Story("ipsum","https://source.unsplash.com/306x300")),
                  StoryWidget(Story("dolor","https://source.unsplash.com/307x300")),
                  StoryWidget(Story("sit","https://source.unsplash.com/308x300")),
                ],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
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
          ))
        ],
      ),
    );
  }
}

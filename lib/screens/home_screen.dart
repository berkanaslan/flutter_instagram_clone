import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/models/story.dart';
import 'package:flutter_instagram_clone/screens/screens_of_first/pushed_screen.dart';
import 'package:flutter_instagram_clone/widgets/custom_app_bar.dart';
import 'package:flutter_instagram_clone/widgets/circular_border.dart';
import 'package:flutter_instagram_clone/widgets/profile_photo_widget.dart';
import 'package:flutter_instagram_clone/widgets/single_post_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frino_icons/frino_icons.dart';

class FirstScreen extends StatelessWidget {
  static const route = '/first';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          Text("Instagram", style: GoogleFonts.satisfy(fontSize: 24)), true),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: [
                  StoryWidget(
                      Story("lorem2", "https://source.unsplash.com/300x300")),
                  StoryWidget(
                      Story("ipsum", "https://source.unsplash.com/300x300")),
                  StoryWidget(
                      Story("sit", "https://source.unsplash.com/300x300")),
                  StoryWidget(
                      Story("dolor", "https://source.unsplash.com/300x300")),
                  StoryWidget(
                      Story("amet", "https://source.unsplash.com/300x300")),
                  StoryWidget(
                      Story("lorem", "https://source.unsplash.com/300x300")),
                  StoryWidget(
                      Story("ipsum", "https://source.unsplash.com/300x300")),
                  StoryWidget(
                      Story("dolor", "https://source.unsplash.com/300x300")),
                  StoryWidget(
                      Story("sit", "https://source.unsplash.com/300x300")),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SinglePostWidget(),
                  SinglePostWidget(),
                  SinglePostWidget(),
                  SinglePostWidget(),
                  SinglePostWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

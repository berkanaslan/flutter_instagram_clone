import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/models/story.dart';
import 'package:flutter_instagram_clone/components/widgets/custom_app_bar.dart';
import 'package:flutter_instagram_clone/components/widgets/circular_border.dart';
import 'package:flutter_instagram_clone/components/widgets/single_post_widget.dart';
import 'package:flutter_instagram_clone/providers/navigation_provider.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  static const route = '/first';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        Text("Instagram", style: GoogleFonts.satisfy(fontSize: 24)),
        IconButton(
          icon: Icon(FrinoIcons.f_chat),
          onPressed: () {},
        ),
      ),
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

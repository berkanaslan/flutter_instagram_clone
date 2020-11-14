import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/models/story.dart';
import 'package:flutter_instagram_clone/components/widgets/custom_app_bar.dart';
import 'package:flutter_instagram_clone/components/widgets/circular_border.dart';
import 'package:flutter_instagram_clone/components/widgets/single_post_widget.dart';
import 'package:flutter_instagram_clone/views/user_auth_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const route = '/first';

  @override
  Widget build(BuildContext context) {
    final _userAuthView = Provider.of<UserAuthView>(context, listen: true);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  FlatButton(
                      onPressed: () {
                        _userAuthView.signOut();
                      },
                      child: Text("Çıkış Yap")),
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

import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/app/screens/profile_settings_screen.dart';
import 'package:flutter_instagram_clone/components/profile_action_button.dart';
import 'package:flutter_instagram_clone/components/widgets/custom_app_bar.dart';
import 'package:flutter_instagram_clone/components/widgets/profile_photo_widget.dart';
import 'package:flutter_instagram_clone/components/widgets/single_post_widget.dart';
import 'package:flutter_instagram_clone/providers/navigation_provider.dart';
import 'package:flutter_instagram_clone/views/user_auth_view.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:provider/provider.dart';

class FourthScreen extends StatelessWidget {
  static const route = '/profile';
  List<Widget> _randomChildren;

  @override
  Widget build(BuildContext context) {
    final _userAuthView = Provider.of<UserAuthView>(context, listen: true);

    return Scaffold(
      appBar: CustomAppBar(
          Text("Profil"),
          IconButton(
            icon: Icon(FrinoIcons.f_login),
            onPressed: () => _signOut(context),
          ),
          0),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          controller: NavigationProvider.of(context)
              .screens[PROFILE_SCREEN]
              .scrollController,
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate([
                  buildHeader(),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Berkan ASLAN",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("akdeniz uni, mis. work at patika global tech."),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileActionButton(
                        onPressed: () {},
                        buttonText: "Takip",
                      ),
                      ProfileActionButton(
                        onPressed: () {},
                        buttonText: "Mesaj",
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProfileActionButton(
                      buttonText: "Profili Düzenle",
                      onPressed: () {
                        Navigator.of(
                          context,
                          rootNavigator: true,
                        ).pushNamed(ProfileSettingsScreen.route);
                      },
                    ),
                  ),
                ]),
              ),
            ];
          },
          // You tab view goes here
          body: Column(
            children: <Widget>[
              TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.grid_on),
                  ),
                  Tab(
                    icon: Icon(Icons.photo_outlined),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [buildGrid(), buildList(context)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ProfilePhotoWidget(96,
        "https://firebasestorage.googleapis.com/v0/b/instagram-clone-from-berkan.appspot.com/o/global%2Fno-profile-photo.png?alt=media&token=eeda3d97-c0c7-4f21-ade3-21421959d4a8"),
        Column(
          children: [
            Text(
              "0",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Gönderi"),
          ],
        ),
        Column(
          children: [
            Text(
              "448",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Takipçi"),
          ],
        ),
        Column(
          children: [
            Text(
              "365",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Takip"),
          ],
        ),
      ],
    );
  }

  ListView buildList(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 22,
      itemBuilder: (context, index) {
        return SinglePostWidget();
      },
    );
  }

  GridView buildGrid() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 2, mainAxisSpacing: 2, crossAxisCount: 3),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          child: Image.network("https://source.unsplash.com/300x300"),
        );
      },
    );
  }

  _signOut(BuildContext context) {
    final _userAuthView = Provider.of<UserAuthView>(context, listen: false);
    _userAuthView.signOut();
  }
}

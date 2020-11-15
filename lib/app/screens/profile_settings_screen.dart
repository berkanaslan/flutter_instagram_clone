import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/components/rounded_button.dart';
import 'package:flutter_instagram_clone/components/rounded_input_field.dart';
import 'package:flutter_instagram_clone/components/widgets/custom_app_bar.dart';
import 'package:flutter_instagram_clone/components/widgets/profile_photo_widget.dart';
import 'package:flutter_instagram_clone/views/user_auth_view.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:provider/provider.dart';

class ProfileSettingsScreen extends StatelessWidget {
  static const route = '/profile/settings';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: CustomAppBar(
            Text("Profil Ayarları"),
            IconButton(
              icon: Icon(FrinoIcons.f_login),
              onPressed: () => _signOut(context),
            ),
            0),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(child: ProfilePhotoWidget(128, "https://firebasestorage.googleapis.com/v0/b/instagram-clone-from-berkan.appspot.com/o/global%2Fno-profile-photo.png?alt=media&token=eeda3d97-c0c7-4f21-ade3-21421959d4a8")),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "Profil Fotoğrafını Değiştir",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              RoundedInputField(
                icon: FrinoIcons.f_rename,
                hintText: "Adınız",
              ),
              RoundedInputField(
                icon: FrinoIcons.f_user,
                hintText: "Kullanıcı adınız",
              ),
              RoundedInputField(
                icon: FrinoIcons.f_book,
                hintText: "Biografi",
              ),
              RoundedButton(
                text: "Kaydet",
                press: () {},
              ),
            ],
          ),
        ));
  }

  _signOut(BuildContext context) {
    final _userAuthView = Provider.of<UserAuthView>(context, listen: false);
    _userAuthView.signOut();
  }
}

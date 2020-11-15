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
    final _userAuthView = Provider.of<UserAuthView>(context, listen: true);

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
              Center(
                  child: ProfilePhotoWidget(
                      128, _userAuthView.person.profilePhotoUrl)),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "Profil Fotoğrafını Değiştir",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Adı"),
                  ),
                  RoundedInputField(
                    icon: FrinoIcons.f_rename,
                    hintText: "Ad",
                    initialValue: _userAuthView.person.name,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Kullanıcı adı"),
                  ),
                  RoundedInputField(
                    icon: FrinoIcons.f_rename,
                    hintText: "Kullanıcı adı",
                    initialValue: _userAuthView.person.userName,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Biografi"),
                  ),
                  RoundedInputField(
                    icon: FrinoIcons.f_rename,
                    hintText: "Biografi",
                    initialValue: _userAuthView.person.bio,
                  ),
                ],
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

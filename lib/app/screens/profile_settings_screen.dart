import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/components/rounded_button.dart';
import 'package:flutter_instagram_clone/components/rounded_input_field.dart';
import 'package:flutter_instagram_clone/components/widgets/custom_app_bar.dart';
import 'package:flutter_instagram_clone/components/widgets/profile_photo_widget.dart';
import 'package:flutter_instagram_clone/views/user_auth_view.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:provider/provider.dart';

class ProfileSettingsScreen extends StatefulWidget {
  static const route = '/profile/settings';

  @override
  _ProfileSettingsScreenState createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  String _userName, _name, _bio;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _userAuthView = Provider.of<UserAuthView>(context, listen: true);
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: false,
        appBar: CustomAppBar(Text("Profil Ayarları"), Container(), 0),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
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
                      initialValue: _userAuthView.person.name,
                      hintText: _userAuthView.person.name != null
                          ? _userAuthView.person.name
                          : "",
                      onSaved: (String input) {
                        _name = input;
                      },
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
                      icon: FrinoIcons.f_user,
                      initialValue: _userAuthView.person.userName,
                      hintText: _userAuthView.person.userName,
                      onSaved: (String input) {
                        _userName = input;
                      },
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
                      icon: FrinoIcons.f_book,
                      initialValue: _userAuthView.person.bio,
                      hintText: _userAuthView.person.bio != null
                          ? _userAuthView.person.bio
                          : "",
                      onSaved: (String input) {
                        _bio = input;
                      },
                    ),
                  ],
                ),
                RoundedButton(
                  text: "Kaydet",
                  press: () {
                    _updateUserDetails();
                    debugPrint(_name);
                    debugPrint(_userName);
                    debugPrint(_bio);
                  },
                ),
              ],
            ),
          ),
        ));
  }

  void _updateUserDetails() async {
    _formKey.currentState.save();
    final _userAuthView = Provider.of<UserAuthView>(context, listen: false);
    if (_userAuthView.person.userName == _userName &&
        _userAuthView.person.name == _name &&
        _userAuthView.person.bio == _bio) {
      final snackBar = SnackBar(
        content: Text("Değişiklik yapmadınız."),
        duration: Duration(seconds: 2),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    } else if (_userName.trim() == "") {
      final snackBar = SnackBar(
        content: Text("Kullanıcı adı boş olamaz."),
        duration: Duration(seconds: 2),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    } else if (_userAuthView.person.userName == _userName) {
      var result = await _userAuthView.updateProfileDetailsWithoutUserName(
          _userAuthView.person.userID, _name.trim(), _bio.trim());

      if (result) {
        _userAuthView.person.bio = _bio;
        _userAuthView.person.name = _name;
        final snackBar = SnackBar(
          content: Text("Başarılı, bilgiler güncellendi."),
          duration: Duration(seconds: 2),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    } else {
      var result = await _userAuthView.updateProfileDetails(
          _userAuthView.person.userID, _name.trim(), _userName.trim(), _bio);

      if (result) {
        _userAuthView.person.userName = _userName;
        _userAuthView.person.bio = _bio;
        _userAuthView.person.name = _name;
        final snackBar = SnackBar(
          content: Text("Başarılı, bilgiler güncellendi."),
          duration: Duration(seconds: 2),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
      } else {
        final snackBar = SnackBar(
          content: Text("Lütfen kullanılmayan bir kullanıcı adı seçin."),
          duration: Duration(seconds: 2),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    }
  }
}

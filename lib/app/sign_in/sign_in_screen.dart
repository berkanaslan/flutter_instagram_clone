import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/components/already_have_an_account_acheck.dart';
import 'package:flutter_instagram_clone/components/rounded_button.dart';
import 'package:flutter_instagram_clone/components/rounded_input_field.dart';
import 'package:flutter_instagram_clone/components/rounded_password_field.dart';
import 'package:flutter_instagram_clone/models/person.dart';
import 'package:flutter_instagram_clone/views/user_auth_view.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  String _mail, _pass, _userName;

  @override
  Widget build(BuildContext context) {
    final _userAuthView = Provider.of<UserAuthView>(context, listen: true);

    return Scaffold(
      appBar: AppBar(elevation: 0),
      resizeToAvoidBottomPadding: false,
      body: _userAuthView.state == ViewState.IDLE
          ? _userAuthView.registerState == RegisterState.REGISTERED
              ? getSignInForm(_userAuthView, context)
              : getSignUpForm(_userAuthView, context)
          : getCircularProgressIndicator(),
    );
  }

  Widget getSignUpForm(UserAuthView _userAuthView, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Instagram",
              style: GoogleFonts.satisfy(fontSize: 48),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "E-Posta",
              icon: FrinoIcons.f_at,
              textInputType: TextInputType.emailAddress,
              errorText: _userAuthView.mailErrorMessage != null
                  ? _userAuthView.mailErrorMessage
                  : null,
              onSaved: (String inputMail) {
                _mail = inputMail;
              },
            ),
            RoundedInputField(
              hintText: "Kullanıcı Adı",
              icon: FrinoIcons.f_user,
              onSaved: (String inputUserName) {
                _userName = inputUserName;
              },
            ),
            RoundedPasswordField(
              errorText: _userAuthView.passErrorMessage != null
                  ? _userAuthView.passErrorMessage
                  : null,
              onSaved: (String inputPass) {
                _pass = inputPass;
              },
            ),
            RoundedButton(
              text: "Kayıt Ol",
              press: () => _formSubmit(),
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                setState(() {
                  _userAuthView.buildFormType();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget getSignInForm(UserAuthView _userAuthView, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Instagram",
              style: GoogleFonts.satisfy(fontSize: 48),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "E-Posta",
              icon: FrinoIcons.f_at,
              textInputType: TextInputType.emailAddress,
              errorText: _userAuthView.mailErrorMessage != null
                  ? _userAuthView.mailErrorMessage
                  : null,
              onSaved: (String inputMail) {
                _mail = inputMail;
              },
            ),
            RoundedPasswordField(
              errorText: _userAuthView.passErrorMessage != null
                  ? _userAuthView.passErrorMessage
                  : null,
              onSaved: (String inputPassword) {
                _pass = inputPassword;
              },
            ),
            RoundedButton(
              text: "Giriş Yap",
              press: () => _formSubmit(),
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                setState(() {
                  _userAuthView.buildFormType();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  _formSubmit() async {
    setState(() {});
    final _userAuthView = Provider.of<UserAuthView>(context, listen: false);
    if (_userAuthView.registerState == RegisterState.REGISTERED) {
      _formKey.currentState.save();

      try {
        Person _person =
            await _userAuthView.signInWithMailAndPass(_mail, _pass);
        if (_person != null) {
          print("Oturum açan kullanıcı ID: " + _person.userID.toString());
        }
      } on FirebaseException catch (e) {
        debugPrint("Giriş yaparken: " + e.code);
      }
    } else {
      setState(() {});
      _formKey.currentState.save();
      final _userAuthView = Provider.of<UserAuthView>(context, listen: false);

      try {
        Person _person =
            await _userAuthView.createWithMailAndPass(_mail, _pass, _userName);
        if (_person != null) {
          print("Oturum açan kullanıcı ID: " + _person.userID.toString());
        }
      } on FirebaseException catch (e) {
        debugPrint("Kayıt olurken hata: " + e.code);
      }
    }
  }

  Widget getCircularProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

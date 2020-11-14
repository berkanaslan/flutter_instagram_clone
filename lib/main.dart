import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_instagram_clone/locator.dart';
import 'package:flutter_instagram_clone/providers/navigation_provider.dart';
import 'package:flutter_instagram_clone/views/user_auth_view.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  await Firebase.initializeApp();

  runApp(App());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, statusBarBrightness: Brightness.dark));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (context) => UserAuthView())
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: NavigationProvider.of(context).onGenerateRoute,
            theme: ThemeData(
              primaryColor: Colors.white,
              accentColor: Colors.black,
              scaffoldBackgroundColor: Colors.white,
            ),
          );
        },
      ),
    );
  }
}

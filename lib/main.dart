import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
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

import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/app/screens/fourth_screen.dart';
import 'package:flutter_instagram_clone/app/screens/home_screen.dart';
import 'package:flutter_instagram_clone/app/screens/root.dart';
import 'package:flutter_instagram_clone/app/screens/second_screen.dart';
import 'package:flutter_instagram_clone/app/screens/third_screen.dart';
import 'package:flutter_instagram_clone/models/screen.dart';
import 'package:flutter_instagram_clone/components/widgets/exit_dialog.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:provider/provider.dart';


const HOME_SCREEN = 0;
const EXPLORE_SCREEN = 1;
const NEW_POST_SCREEN = 2;
const ACTIVITY_SCREEN = 3;
const PROFILE_SCREEN = 4;

class NavigationProvider extends ChangeNotifier {
  /// [NavigationProvider] edinmek için shortcode
  static NavigationProvider of(BuildContext context) =>
      Provider.of<NavigationProvider>(context, listen: false);

  // Açılış sayfası
  int _currentScreenIndex = HOME_SCREEN;

  int get currentTabIndex => _currentScreenIndex;

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(builder: (_) => Root());
    }
  }

  final Map<int, Screen> _screens = {
    HOME_SCREEN: Screen(
      title: 'Home',
      icon: FrinoIcons.f_home,
      child: HomeScreen(),
      initialRoute: HomeScreen.route,
      navigatorState: GlobalKey<NavigatorState>(),
      onGenerateRoute: (settings) {

        switch (settings.name) {
          default:
            return MaterialPageRoute(builder: (_) => HomeScreen());
        }
      },
      scrollController: ScrollController(),
    ),
    EXPLORE_SCREEN: Screen(
      title: 'Second',
      icon: FrinoIcons.f_search,
      child: SecondScreen(),
      initialRoute: SecondScreen.route,
      navigatorState: GlobalKey<NavigatorState>(),
      onGenerateRoute: (settings) {
        print('Oluşturulan route: ${settings.name}');
        switch (settings.name) {
          default:
            return MaterialPageRoute(builder: (_) => SecondScreen());
        }
      },
      scrollController: ScrollController(),
    ),
    NEW_POST_SCREEN: Screen(
      title: 'Third',
      icon: FrinoIcons.f_arrow_up_circle,
      child: ThirdScreen(),
      initialRoute: ThirdScreen.route,
      navigatorState: GlobalKey<NavigatorState>(),
      onGenerateRoute: (settings) {
        print('Oluşturulan route: ${settings.name}');
        switch (settings.name) {
          default:
            return MaterialPageRoute(builder: (_) => ThirdScreen());
        }
      },
      scrollController: ScrollController(),
    ),
    ACTIVITY_SCREEN: Screen(
      title: 'Fourth',
      icon: FrinoIcons.f_heart,
      child: SecondScreen(),
      initialRoute: SecondScreen.route,
      navigatorState: GlobalKey<NavigatorState>(),
      onGenerateRoute: (settings) {
        print('Oluşturulan route: ${settings.name}');
        switch (settings.name) {
          default:
            return MaterialPageRoute(builder: (_) => SecondScreen());
        }
      },
      scrollController: ScrollController(),
    ),
    PROFILE_SCREEN: Screen(
      title: 'Fourth',
      icon: FrinoIcons.f_user,
      child: FourthScreen(),
      initialRoute: FourthScreen.route,
      navigatorState: GlobalKey<NavigatorState>(),
      onGenerateRoute: (settings) {
        print('Oluşturulan route: ${settings.name}');
        switch (settings.name) {
          default:
            return MaterialPageRoute(builder: (_) => FourthScreen());
        }
      },
      scrollController: ScrollController(),
    ),
  };

  List<Screen> get screens => _screens.values.toList();

  Screen get currentScreen => _screens[_currentScreenIndex];

  void setTab(int tab) {
    if (tab == currentTabIndex) {
      _scrollToTopOfPage();
    } else {
      _currentScreenIndex = tab;
      notifyListeners();
    }
  }

  /// If currently displayed screen has given [ScrollController] animate it
  /// to the start of scroll view.
  void _scrollToTopOfPage() {
    if (currentScreen.scrollController != null &&
        currentScreen.scrollController.hasClients) {
      currentScreen.scrollController.animateTo(
        0.0,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  /// [WillPopScope] callback'i sağlar
  Future<bool> onWillPop(BuildContext context) async {
    final currentNavigatorState = currentScreen.navigatorState.currentState;

    if (currentNavigatorState.canPop()) {
      currentNavigatorState.pop();
      return false;
    } else {
      if (currentTabIndex != HOME_SCREEN) {
        setTab(HOME_SCREEN);
        notifyListeners();
        return false;
      } else {
        return await showDialog(
          context: context,
          builder: (context) => ExitAlertDialog(),
        );
      }
    }
  }
}

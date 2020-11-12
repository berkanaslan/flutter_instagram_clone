import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

/// Navigation entry point for app.
class Root extends StatelessWidget {
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, provider, child) {
        // Tanımladığımız screen'lardan BottomNavigationBar oluşturma
        final bottomNavigationBarItems = provider.screens
            .map(
              (screen) => DotNavigationBarItem(
                icon: Icon(screen.icon),
              ),
            )
            .toList();

        // Her ekran için [Navigator] örneğini başlatma
        final screens = provider.screens
            .map(
              (screen) => Navigator(
                key: screen.navigatorState,
                onGenerateRoute: screen.onGenerateRoute,
              ),
            )
            .toList();

        return WillPopScope(
          onWillPop: () async => provider.onWillPop(context),
          child: Scaffold(
            body: IndexedStack(
              children: screens,
              index: provider.currentTabIndex,
            ),
            bottomNavigationBar: DotNavigationBar(
              items: bottomNavigationBarItems,
              currentIndex: provider.currentTabIndex,
              onTap: provider.setTab,
              dotIndicatorColor: Colors.black,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black,
            ),
          ),
        );
      },
    );
  }
}

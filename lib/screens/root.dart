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
              (screen) => BottomNavigationBarItem(
                icon: Icon(screen.icon),
                label: screen.title,
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
            bottomNavigationBar: BottomNavigationBar(
              iconSize: 30,
              type: BottomNavigationBarType.fixed,
              items: bottomNavigationBarItems,
              currentIndex: provider.currentTabIndex,
              onTap: provider.setTab,
            ),
          ),
        );
      },
    );
  }
}

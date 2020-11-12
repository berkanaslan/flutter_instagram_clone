import 'package:flutter/material.dart';

/// [Screen] Ekran oluşturrurken gereken tüm bilgileri tutacak
class Screen {
  /// BottomNavigationBar'da gösterilecek olan başlık
  final String title;

  /// BottomNavigationBar'da gösterilecek olan ikon
  final IconData icon;

  /// Ekranda akacak olan WidgetTree tutucusu
  final Widget child;

  /// İlgili ekranın devamı için isimlendirilmiş rota oluşturucu [Navigator]
  final RouteFactory onGenerateRoute;

  /// İlk rotanın [onGenerateRoute] içinde implemente edilmesi gerekiyor
  final String initialRoute;

  /// İlgili ekranın [NavigatorState]'i için key gerekiyor
  final GlobalKey<NavigatorState> navigatorState;

  /// ISTEGE BAGLI: İlgili ekranın en üstüne dönerken hareket animasyonunu değiştirmek için gerekli
  final ScrollController scrollController;

  Screen({
    @required this.title,
    @required this.icon,
    @required this.child,
    @required this.onGenerateRoute,
    @required this.initialRoute,
    @required this.navigatorState,
    this.scrollController,
  });
}

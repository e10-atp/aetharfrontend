import 'package:flutter/material.dart';
import 'supplemental/cut_corners_border.dart';
import 'colors.dart';
import 'home.dart';
import 'login.dart';
import 'backdrop.dart';
import 'model/product.dart';
import 'category_menu_page.dart';
import 'artest.dart';

class AETHARApp extends StatefulWidget {
  const AETHARApp({Key? key}) : super(key: key);

  @override
  State<AETHARApp> createState() => _AETHARAppState();
}

class _AETHARAppState extends State<AETHARApp> {
  Category _currentCategory = Category.friends;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'æthar',
      home: Backdrop(
        currentCategory: _currentCategory,
        frontLayer: HomePage(
          category: _currentCategory,
        ),
        backLayer: CategoryMenuPage(
          currentCategory: _currentCategory,
          onCategoryTap: _onCategoryTap,
        ),
        frontTitle: const Text('æthar'),
        backTitle: const Text('menu'),
      ),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      theme: _kShrineTheme,
    );
  }

  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => const LoginPage(),
      fullscreenDialog: true,
    );
  }
}

// TODO: Build a Shrine Theme (103)
final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: aePurple100,
        onPrimary: aeBlack900,
        secondary: aeBlack900,
        error: aeErrorRed,
      ),
      scaffoldBackgroundColor: aeSurfaceWhite,
      textTheme: _buildShrineTextTheme(base.textTheme),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: aePurple100,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: aeBlack900,
          ),
        ),
        border: CutCornersBorder(),
      ));
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6!.copyWith(
          fontSize: 18.0,
        ),
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyText1: base.bodyText1!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Poppins',
        displayColor: aeBlack900,
        bodyColor: aeBlack900,
      );
}

import 'package:flutter/material.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/home_screen.dart';
import 'package:islamiapp/tabs/quran/quran_service.dart';
import 'package:islamiapp/tabs/quran/sura_detalis_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await QuranService.getMostRecentlySuras();
  runApp(IslamiApp());
}

class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}

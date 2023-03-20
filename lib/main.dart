import 'package:RaceHub/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:RaceHub/home_page.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

Future<void> main() async {
  await Settings.init(
      cacheProvider:
          SharePreferenceCache()); //Wait for settings to be loaded before app launches
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    
    //Load in darkmode (default = false):
    final isDarkMode = Settings.getValue<bool>(SettingsPage.keyDarkMode, false);
    return ValueChangeObserver<bool>(
      cacheKey: SettingsPage.keyDarkMode,
      defaultValue: false,
      builder: (_, isDarkMode, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Title",
        theme: isDarkMode
            ? ThemeData.dark().copyWith(
                primaryColor: Colors.blueGrey,
                scaffoldBackgroundColor: Colors.black,
                canvasColor: Colors.black,
              )
            : ThemeData.light().copyWith(
                primaryColor: Colors.blueGrey,
                scaffoldBackgroundColor: Colors.white,
                canvasColor: Colors.white,
              ),
        home: HomePage(),
      ),
    );
  }
}

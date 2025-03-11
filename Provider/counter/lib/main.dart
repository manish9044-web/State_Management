import 'package:counter/Provider/count_provider.dart';
import 'package:counter/Provider/example_one_provider.dart';
import 'package:counter/Provider/example_two_provider.dart';
import 'package:counter/Provider/theme_changer_provider.dart';
import 'package:counter/Screens/ExampleTwo/example_two_screen.dart';
import 'package:counter/Screens/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => ExampleTwoProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: ThemeChangerProvider().themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.blue,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.red,
              iconTheme: IconThemeData(color: Colors.white)
            ),
            home: DarkThemeScreen(),
          );
        }));
  }
}

import 'package:flutter/material.dart';
import 'package:nike2/theme.dart';
import 'package:nike2/ui/home/home.dart';

// hhhhhhhhhhhhhhhhhhhhh
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    const defaulttextstyle =
        TextStyle(fontFamily: 'Dana', color: LightThemeColors.primaryTextColor);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
            labelLarge: defaulttextstyle,
            bodyMedium: defaulttextstyle,
            titleLarge: defaulttextstyle.copyWith(fontWeight: FontWeight.bold),
            bodySmall: defaulttextstyle.apply(
                color: LightThemeColors.secondTextryColor)),
        colorScheme: const ColorScheme.light(
            primary: LightThemeColors.primaryColor,
            secondary: LightThemeColors.secondryColor,
            onSecondary: Colors.white),
        useMaterial3: true,
      ),
      home: const Directionality(
          textDirection: TextDirection.rtl, child: HomeScreen()),
    );
  }
}

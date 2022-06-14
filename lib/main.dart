import 'package:flutter/material.dart';
import 'package:movie_app/app/shared/routes/routes.dart';
import 'package:movie_app/app/shared/themes/theme.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: ROUTES,
      theme: Themes.defaultTheme,
      initialRoute: "/",
    ),
  );
}

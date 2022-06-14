// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:movie_app/app/shared/routes/routes_names.dart';
import 'package:movie_app/app/views/home_screen/home_screen.dart';

Map<String, Widget Function(BuildContext)> ROUTES = <String, WidgetBuilder>{
  HOME_SCREEN: (_) => const HomeScreen(),
};



import 'package:flutter/material.dart';


final themeDark = ThemeData.dark().copyWith(
        primaryColor: Colors.black45,
        indicatorColor: Colors.green,
        textTheme: TextTheme(
          titleMedium: TextStyle(
            color: Colors.white,
          )
        )
  );

final themeLight = ThemeData(
        primaryColor: Colors.white70,
        indicatorColor: Colors.green,
        textTheme: TextTheme(
          titleMedium: TextStyle(
            color: Colors.black,
          )
        )
);

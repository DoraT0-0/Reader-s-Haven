import 'package:flutter/material.dart';

void showAlert(BuildContext context, String text) {
  final theme = Theme.of(context);
  final snackBar = SnackBar(
            content: Center(child: Text(text, style: TextStyle(color: theme.indicatorColor))),
            backgroundColor: theme.primaryColor,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(75),
            elevation: 30,
            duration: Duration(seconds: 2),
            shape: StadiumBorder()
            );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
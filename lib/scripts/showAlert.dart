import 'package:flutter/material.dart';

void showAlert(BuildContext context, String text, {int seconds=2}) {
  final theme = Theme.of(context);
  final snackBar = SnackBar(
            content: Center(child: Text(text, style: TextStyle(color: theme.textTheme.titleMedium!.color))),
            backgroundColor: theme.primaryColor,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(75),
            elevation: 0,
            duration: Duration(seconds: seconds),
            shape: StadiumBorder()
            );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
}


import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';


@RoutePage()
class DescriptionPage extends StatefulWidget {
  final String title;
  const DescriptionPage({
    super.key,
    required this.title,
  });
  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: Text(widget.title),
      ),
    );
  }
}
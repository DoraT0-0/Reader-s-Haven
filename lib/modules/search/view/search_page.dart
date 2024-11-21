import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,

        title: Text("Поисковик"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search))
        ],
      ),);
  }
}
import 'package:auto_route/auto_route.dart';
import 'package:readershaven_app/modules/search/model/listUrlTitle.dart';

import '../../../router/router.gr.dart';
import '../../../scripts/scripts.dart';
import 'package:flutter/material.dart';

class CardBookSearch extends StatefulWidget {
  const CardBookSearch({
    super.key,
    required this.listBookDB
  });
  final List<ListBookDB> listBookDB;

  @override
  State<CardBookSearch> createState() => _CardBookSearchState();
}

class _CardBookSearchState extends State<CardBookSearch> {
  Future<String> path = createFolderInAppDocDir('books');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return 
        ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: widget.listBookDB.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          String name = widget.listBookDB[index].title!;
          return ListTile(
              title: Text(name, style:TextStyle(fontSize: 22)),
              leading: Icon(Icons.book),
              trailing: 
              IconButton(onPressed: () {downloadFile(index, path, widget.listBookDB, context);}, icon: Icon(Icons.download, size: 22, color: theme.indicatorColor,)),
              onTap: ()  {
                  context.router.push(DescriptionRoute(id: widget.listBookDB[index].id!));
              },
        );
        }
    );
  }
}
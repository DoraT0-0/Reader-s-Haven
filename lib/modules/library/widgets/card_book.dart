import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:readershaven_app/router/router.gr.dart';
import 'package:readershaven_app/scripts/scripts.dart';

class CardBook extends StatelessWidget {
  const CardBook({
    super.key,
    required this.title, required this.updateList, required this.pathFiles
  });
  final Function() updateList;
  final List<String> title;
  final List<String> pathFiles;
  
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: title.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          int l = title[index].length;
          String name = title[index].substring(0, l-4); 
          return ListTile(
              title: Text(name, style:TextStyle(fontSize: 22)),
              leading: Icon(Icons.book),
              trailing: IconButton(onPressed: () {deleteFile(title[index], updateList, context);}, icon: Icon(Icons.delete_sharp, size: 22, color: Colors.red,)),
              onTap: ()  {
                context.router.push(ReaderRoute(title: name, file: pathFiles[index]));
              },
          );
        }
    );
  }
}

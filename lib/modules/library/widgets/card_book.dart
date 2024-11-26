import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../model/model.dart';
import 'package:readershaven_app/router/router.gr.dart';
import 'package:readershaven_app/scripts/scripts.dart';

class CardBook extends StatelessWidget {
  const CardBook({
    super.key,
    required this.list_path_title, required this.updateList
  });
  final Function() updateList;
  final List<ListPathTitle> list_path_title;
  
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: list_path_title.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          int l = list_path_title[index].title!.length;
          String name = list_path_title[index].title!.substring(0, l-4); 
          return ListTile(
              title: Text(name, style:TextStyle(fontSize: 22)),
              leading: Icon(Icons.book),
              trailing: IconButton(onPressed: () {deleteFile(list_path_title[index].title!, updateList, context);}, icon: Icon(Icons.delete_sharp, size: 22, color: Colors.red,)),
              onTap: ()  {
                context.router.push(ReaderRoute(title: name, file: list_path_title[index].pathFile!));
              },
          );
        }
    );
  }
}

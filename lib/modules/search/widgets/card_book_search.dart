import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
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
  Future<void> downloadFile(int id_book) async {
    ListBookDB book = widget.listBookDB.firstWhere((element) => element.id == id_book);
    //print('${fileName.title}, ${fileName.download} $index');
    try {
      setState(() {
        book.download = true;
        book.progress = 0.0;
      });
      Dio dio = Dio();
      String savePath = '${await path}/${book.title}.pdf';
      await dio.download(book.url!, savePath, onReceiveProgress: (count, total) {
        if (total != -1){
          setState(() {
          book.download = true;
          book.progress = (count/ total) * 100;
        });
        }
      });
      showAlert(context, '${book.title} скачан');
      setState(() {
        book.progress = 0.0;
        book.download = false;
      });
    } catch (e) {
      setState(() {
        book.progress = 0.0;
        book.download = false;
      });
      showAlert(context, '${book.title} не скачан. Ошибка');
    }
  }
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
          return 
          ListTile(
              title: Text(name, style:TextStyle(fontSize: 22)),
              leading: Icon(Icons.book),
              trailing: widget.listBookDB[index].download ?
              SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    value: widget.listBookDB[index].progress / 100,
                    color: theme.indicatorColor,
                    strokeWidth: 3,
                  ),
                ) :
              IconButton(onPressed: () {downloadFile(widget.listBookDB[index].id!);}, icon: Icon(Icons.download, size: 22, color: theme.indicatorColor,)),
              onTap: ()  {
                  context.router.push(DescriptionRoute(id: widget.listBookDB[index].id!));
              },
        );
        }
    );
  }
}
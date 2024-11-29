import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:readershaven_app/modules/search/model/listUrlTitle.dart';

import '../../../router/router.gr.dart';
import '../../../scripts/scripts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  List<bool> downloading = [];
  List<double> progress = [];

  Future<void> getlen() async{
    try{
      String uri = "http://readershavenapi-dorat0.amvera.io/books";
      var res = await http.get(Uri.parse(uri));
      List response = jsonDecode(res.body);
      setState(() {
        downloading = List.filled(response.length, false);
        progress = List.filled(response.length, 0.0);
      });
    }catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    if(downloading.isEmpty && progress.isEmpty){getlen();}
  }
  Future<void> downloadFile(int index) async {
    try {
      setState(() {
          downloading[index] = true;
        });
      Dio dio = Dio();
      String? fileName = widget.listBookDB[index].title;
      String savePath = '${await path}/$fileName.pdf';
      await dio.download(widget.listBookDB[index].url!, savePath, onReceiveProgress: (count, total) {
        if(total != -1){
            setState(() {
              progress[index] = (count / total) * 100;
            });
            print('Загрузка: ${progress[index].toStringAsFixed(2)}%');
        }
      });
      setState(() {
        downloading[index] = false;
        progress[index] = 0.0;
        showAlert(context, '$fileName скачан');
        print('Скачано');
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        downloading[index] = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return 
    downloading.isEmpty && progress.isEmpty ? 
        Center(child: CircularProgressIndicator(
                  color: theme.indicatorColor,
                  strokeWidth: 3,),) 
        : 
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
              downloading[index]? SizedBox(width: 22,height: 22,
                child: CircularProgressIndicator(
                  value: progress[index] / 100,
                  color: theme.indicatorColor,
                  strokeWidth: 3,
                ),
              ):
              IconButton(onPressed: () {downloadFile(index);}, icon: Icon(Icons.download, size: 22, color: theme.indicatorColor,)),
              onTap: ()  {
                  context.router.push(DescriptionRoute(id: widget.listBookDB[index].id!));
              },
        );
        }
    );
  }
}
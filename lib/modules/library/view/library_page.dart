import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '../widgets/card_book.dart';
import 'package:readershaven_app/scripts/scripts.dart';
import '../model/model.dart';
@RoutePage()
class LibraryPage extends StatefulWidget {
  const LibraryPage({
    super.key,
  });

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  static List<ListPathTitle> list_path_title = [];
  List<ListPathTitle> display_list = List.from(list_path_title);

  late List<FileSystemEntity> arr;
  Future<String> path = createFolderInAppDocDir('books');

  bool isSearchClicked = false;
  @override
  void initState() {
    super.initState();
    updateList();
  }

  void filterList(String value){
    setState(() {
      display_list = list_path_title
      .where((element) => element.title!.substring(0, element.title!.length-4).toLowerCase().contains(value.toLowerCase()))
      .toList();
    });
  }

  Future<void> updateList() async{
      arr = dirContents(await path);
      list_path_title.clear();
      for(var item in arr){
        list_path_title.add(ListPathTitle(basename(item.path), item.path));
      }
      setState(() {
        list_path_title = list_path_title;
        if(!isSearchClicked) display_list = list_path_title;
      });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: isSearchClicked ? TextField(
          onChanged: (value) => filterList(value),
          decoration: InputDecoration(border: InputBorder.none, hintText: "Поиск..."),
          ) : const Text("Библиотека"),
        actions: [
          IconButton(onPressed: () {setState(() {if(isSearchClicked)filterList(''); isSearchClicked = !isSearchClicked;});}, icon: Icon(isSearchClicked ? Icons.close : Icons.search)),
          IconButton(onPressed: () {addFile(path, updateList, context);}, icon: Icon(Icons.add))
        ],
      ),
      
      body: RefreshIndicator(
        onRefresh: updateList,
        color: theme.indicatorColor,
        child: CardBook(list_path_title: display_list ,updateList: updateList),
      )
    );
  }
}

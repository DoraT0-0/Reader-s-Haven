import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '../widgets/card_book.dart';
import 'package:readershaven_app/scripts/scripts.dart';
@RoutePage()
class LibraryPage extends StatefulWidget {
  const LibraryPage({
    super.key,
  });

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  List<String> title = [];
  List<String> pathFiles = [];
  List<String> arrBasename = [];
  List<String> arrPath = [];

  FilePickerResult? result;
  late List<FileSystemEntity> arr;
  Future<String> path = createFolderInAppDocDir('books');

  final TextEditingController _searchController = TextEditingController();
  bool isSearchClicked = false;
  @override
  void initState() {
    super.initState();
    updateList();
  }

  Future<void> updateList() async{
      arr = dirContents(await path);
      arrBasename.clear();
      arrPath.clear();
      for (var item in arr) {
        arrBasename.add(basename(item.path));
        arrPath.add(item.path);
      }
      setState(() {
        title = arrBasename;
        pathFiles = arrPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,

        title: isSearchClicked ? TextField(
          controller: _searchController,
          decoration: InputDecoration(border: InputBorder.none, hintText: "Поиск..."),
          ) : const Text("Библиотека"),
        actions: [
          IconButton(onPressed: () {setState(() {isSearchClicked = !isSearchClicked;});}, icon: Icon(isSearchClicked ? Icons.close : Icons.search)),
          IconButton(onPressed: () {addFile(path, updateList, context);}, icon: Icon(Icons.add))
        ],
      ),
      
      body: RefreshIndicator(
        onRefresh: updateList,
        color: theme.indicatorColor,
        child: CardBook(title: title, updateList: updateList, pathFiles: pathFiles),
      )
    );
  }
}

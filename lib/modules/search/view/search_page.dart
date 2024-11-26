import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../router/router.gr.dart';
import '../../../scripts/scripts.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<String> path = createFolderInAppDocDir('books');
  var url = "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf";
  bool downloading = false;
  Future downloadFile() async {
    try {
      Dio dio = Dio();
      String fileName = url.substring(url.lastIndexOf("/") + 1);
      String savePath = '${await path}/$fileName';
      await dio.download(url, savePath, onReceiveProgress: (rec, total) {
        setState(() {
          downloading = true;
        });
      } );
      setState(() {
        downloading = false;
        showAlert(context, '${fileName.substring(0, fileName.length-4)} скачан');
        print('Скачано');
      });
    } catch (e) {
      print(e.toString());
    }
  }
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
      ),
      body: ListTile(
        title: Text("Title", style:TextStyle(fontSize: 22)),
        leading: Icon(Icons.book),
        trailing: downloading? SizedBox(width: 22,height: 22,
          child: CircularProgressIndicator(
            color: theme.indicatorColor,
            strokeWidth: 3,
          ),
        ):
        IconButton(onPressed: () {downloadFile();}, icon: Icon(Icons.download, size: 22, color: theme.indicatorColor,)),
        onTap: ()  {
            context.router.push(DescriptionRoute(title: 'Title'));
        },
      ),
      );
  }

}
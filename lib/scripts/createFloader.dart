import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> createFolderInAppDocDir(String folderName) async {
  final Directory? appDocDir = await getDownloadsDirectory();
  final Directory appDocDirFolder = Directory('${appDocDir?.path}/$folderName/');

  if (await appDocDirFolder.exists()) {
    //print('Папка есть ' + appDocDirFolder.path);
    return appDocDirFolder.path;
  } else {
    final Directory appDocDirNewFolder = await appDocDirFolder.create(recursive: true);
    //print('Папка создалась ' + appDocDirNewFolder.path);
    return appDocDirNewFolder.path;
  }
}
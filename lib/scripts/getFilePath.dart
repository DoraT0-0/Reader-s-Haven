

import 'package:readershaven_app/scripts/scripts.dart';

Future<String> getFilePath(String path) async {
  Future<String> pathDir = createFolderInAppDocDir('books');
  return '${await pathDir}$path';
}

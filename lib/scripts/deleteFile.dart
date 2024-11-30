import 'dart:io';
import 'package:readershaven_app/scripts/createFloader.dart';
import 'showAlert.dart';
void deleteFile(String path, Function() updateList, context) async{
  try {
      Future<String> pathDir = createFolderInAppDocDir('books');
      String filePath = '${await pathDir}$path';
      File fileToDelete = File(filePath);
      if (await fileToDelete.exists()) {
        await fileToDelete.delete();
        showAlert(context, 'Книга удалена');
        updateList();
      } else {
        showAlert(context, 'Книга не найдена');
      }
    } catch (e) {
      showAlert(context, 'Ошибка при удалении книги $e');
    }
}
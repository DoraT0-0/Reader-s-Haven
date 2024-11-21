import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'scripts.dart';

FilePickerResult? result;
void addFile(Future<String> path, void Function() updateList, context) async{
  result = await FilePicker.platform.pickFiles();
  if (result != null) {
    String? filePath = result?.files.single.path;
    if (filePath != null && filePath.substring(filePath.length-4, filePath.length) == '.pdf') {
      String newFilePath = '${await path}${result!.files.single.name}';
      moveFile(filePath, newFilePath);
      print('Файл перемещён в: $newFilePath');
      showAlert(context, 'Книга добавлена');
      updateList();
    }else {
      showAlert(context, 'Книга не добавлена');
      print('Выбор файла отменён');
    }
  } else {
    showAlert(context, 'Книга не выбрана');
    print('Файл не выбран!');
  }
}

void moveFile(String oldPath, String newPath) async {
    try {
      File oldFile = File(oldPath);
      await oldFile.copy(newPath);
      await oldFile.delete();
      print('Файл успешно перемещён!');
    } catch (e) {
      print('Ошибка при перемещении файла: $e');
    }
}


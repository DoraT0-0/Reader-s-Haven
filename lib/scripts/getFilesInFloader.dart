import 'dart:io';

List<FileSystemEntity> dirContents(String path) {
  Directory dir = Directory(path);
  List<FileSystemEntity> entries = dir.listSync(recursive: false).toList();
  return entries;
}
import 'package:dio/dio.dart';
import '../modules/search/model/model.dart';
import 'scripts.dart';

Future<void> downloadFiles(int index, Future<String> path, List<ListBookDB> listBookDB, context) async {
    String? fileName = listBookDB[index].title;
    try {
      Dio dio = Dio();
      String savePath = '${await path}/$fileName.pdf';
      await dio.download(listBookDB[index].url!, savePath, onReceiveProgress: (count, total) {
      });
      showAlert(context, '$fileName скачан');
    } catch (e) {
      showAlert(context, '$fileName не скачан. Ошибка');
    }
  }
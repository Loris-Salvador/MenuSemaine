import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<String> get localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}


Future<File> get localFile async {
  final path = await localPath;
  return File('$path/semaine_suivantetest.json');
}

Future<String> get localPath2 async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}


Future<File> get localFile2 async {
  final path = await localPath;
  return File('$path/semaine_actuelletest.json');
}



Future<void> saveDateToFile(DateTime date) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/datetest.txt');
  await file.writeAsString(date.toIso8601String(), flush: true);
}

Future<DateTime> readDateFromFile() async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/date.txt');
  if (await file.exists()) {
    final dateString = await file.readAsString();
    return DateTime.parse(dateString);
  }
  return DateTime(2000); // Valeur par défaut si le fichier n'existe pas
}

import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import '../model/semaine_model.dart';
import '../services/file/file.dart';

class SemaineRepository
{
  final Future<Database> database;
  SemaineModel semaineAcutelle = SemaineModel();
  SemaineModel semaineSuivante = SemaineModel();

  SemaineRepository(this.database);


  void addSemaineSuivante(String lundi, String mardi, String mercredi, String jeudi, String vendredi, String samedi, String dimanche) async{

    semaineSuivante.menu.clear();

    semaineSuivante.menu.add(lundi);
    semaineSuivante.menu.add(mardi);
    semaineSuivante.menu.add(mercredi);
    semaineSuivante.menu.add(jeudi);
    semaineSuivante.menu.add(vendredi);
    semaineSuivante.menu.add(samedi);
    semaineSuivante.menu.add(dimanche);


  }


  Future<void> initialize() async {

    DateTime now = DateTime.now();


    final f = await localFile;

    if(await f.exists()){
      print("ok");
      final String jsons =  await f.readAsString();
      print(jsons);
      final j = json.decode(jsons);
      print(j);

      semaineSuivante.menu = semaineSuivante.fromJ(j);
    }
    else{
      saveDateToFile(getNextSunday(getNextSunday(now)));
      semaineAcutelle.menu = ["", "", "", "", "", "", ""];
      semaineSuivante.menu = ["", "", "", "", "", "", ""];
      return;
    }

    DateTime savedDate = await readDateFromFile();

    print(savedDate);
    print(now);

    bool isNextWeek = now.isAfter(savedDate); //now.isAfter(savedDate);




    if (isNextWeek) {

      List<String> rien = ["", "", "", "", "", "", ""];


      semaineAcutelle.menu = semaineSuivante.menu;
      semaineSuivante.menu = rien;

      final file = await localFile;

      final json = semaineSuivante.toJson(); // Convertir l'objet en JSON



      file.writeAsStringSync(json.toString(), flush: true); // Écrire la chaîne JSON dans le fichier

      final file2 = await localFile2;

      final json2 = semaineAcutelle.toJson(); // Convertir l'objet en JSON



      file2.writeAsStringSync(json2.toString(), flush: true); // Écrire la chaîne JSON dans le fichier


      saveDateToFile(getNextSunday(now));

      print("newt sunday");
      print(getNextSunday(now));

    } else {

      final file = await localFile;

      if(await file.exists()){
        print("ok");
        final String jsons =  await file.readAsString();
        print(jsons);
        final j = json.decode(jsons);
        print(j);

        semaineSuivante.menu = semaineSuivante.fromJ(j);
      }
      else{
        print("EXISTE PAS");
      }

      print("what");


      final file2 = await localFile2;

      if(await file2.exists()){
        print("ok");
        final String jsons =  await file2.readAsString();
        print(jsons);
        final j = json.decode(jsons);
        print(j);

        semaineAcutelle.menu = semaineAcutelle.fromJ(j);
      }
      else{
        print("EXISTE PAS");
        semaineAcutelle.menu = ["", "", "", "", "", "", ""];
      }


    }









  }
  DateTime getNextSunday(DateTime fromDate) {
    // Trouver le prochain dimanche
    DateTime nextSunday = fromDate;
    while (nextSunday.weekday != DateTime.sunday) {
      nextSunday = nextSunday.add(Duration(days: 1));
    }

    // Mettre l'heure à 23h59
    nextSunday = DateTime(nextSunday.year, nextSunday.month, nextSunday.day, 23, 59);

    return nextSunday;
  }



}


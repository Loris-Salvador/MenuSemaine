import 'dart:async';
import 'package:sqflite/sqflite.dart';


class ListsMenusRepository
{
  List<String> Lundi = [];
   List<String> Mardi = [];
   List<String> Mercredi = [];
   List<String> Jeudi = [];
   List<String> Vendredi = [];
   List<String> Samedi = [];
  List<String> Dimanche = [];

  void addLundi(String menuName) async
  {
      Lundi.add(menuName);
      await insertLundi(menuName);
  }
  void addMardi(String menuName) async
  {
    Mardi.add(menuName);
    await insertMardi(menuName);
  }
  void addMercredi(String menuName) async
  {
    Mercredi.add(menuName);
    await insertMercredi(menuName);
  }
  void addJeudi(String menuName) async
  {
    Jeudi.add(menuName);
    await insertJeudi(menuName);
  }
  void addVendredi(String menuName) async
  {
    Vendredi.add(menuName);
    await insertVendredi(menuName);
  }
  void addSamedi(String menuName) async
  {
    Samedi.add(menuName);
    await insertSamedi(menuName);
  }
  void addDimanche(String menuName) async
  {
    Dimanche.add(menuName);
    await insertDimanche(menuName);
  }


  void removeLundi(String menuName) async
  {
    Lundi.remove(menuName);
    await deleteMenuFromLundi(menuName);
  }





  final Future<Database> database;



  ListsMenusRepository(this.database);

  Future<void> initialize() async{
    print("CONSTRUCTOR");
    await getLundiFromDB().then((value) {
      Lundi = value;
    });
    await getMardiFromDB().then((value) {
      Mardi = value;
    });
    await getMercrediFromDB().then((value) {
      Mercredi.addAll(value);
    });
    await getJeudiFromDB().then((value) {
      Jeudi.addAll(value);
    });
    await getVendrediFromDB().then((value) {
      Vendredi.addAll(value);
    });
    await getSamediFromDB().then((value) {
      Samedi.addAll(value);
    });
    await getDimancheFromDB().then((value) {
      Dimanche.addAll(value);
    });

    print("After" + Lundi.toString());
  }


  // Define a function that inserts dogs into the database
  Future<void> insertLundi(String data) async {
    // Get a reference to the database.
    final db = await database;

    Map<String, dynamic> map = {
      "nom": data,
    };

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'MenuLundi',
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertMardi(String data) async {
    // Get a reference to the database.
    final db = await database;

    Map<String, dynamic> map = {
      "nom": data,
    };

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'MenuMardi',
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertMercredi(String data) async {
    // Get a reference to the database.
    final db = await database;

    Map<String, dynamic> map = {
      "nom": data,
    };

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'MenuMercredi',
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertJeudi(String data) async {
    // Get a reference to the database.
    final db = await database;

    Map<String, dynamic> map = {
      "nom": data,
    };

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'MenuJeudi',
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertVendredi(String data) async {
    // Get a reference to the database.
    final db = await database;

    Map<String, dynamic> map = {
      "nom": data,
    };

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'MenuVendredi',
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertSamedi(String data) async {
    // Get a reference to the database.
    final db = await database;

    Map<String, dynamic> map = {
      "nom": data,
    };

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'MenuSamedi',
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertDimanche(String data) async {
    // Get a reference to the database.
    final db = await database;

    Map<String, dynamic> map = {
      "nom": data,
    };

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'MenuDimanche',
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<String>> getLundiFromDB() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('MenuLundi');

    print("MAP : " + maps.length.toString());

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return maps[i]['nom'];
    });
  }

  Future<List<String>> getMardiFromDB() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('MenuMardi');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return maps[i]['nom'];
    });
  }

  Future<List<String>> getMercrediFromDB() async{
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('MenuMercredi');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return maps[i]['nom'];
    });
  }

  Future<List<String>> getJeudiFromDB() async{
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('MenuJeudi');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return maps[i]['nom'];
    });
  }

  Future<List<String>> getVendrediFromDB() async{
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('MenuVendredi');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return maps[i]['nom'];
    });
  }

  Future<List<String>> getSamediFromDB() async{
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('MenuSamedi');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return maps[i]['nom'];
    });
  }

  Future<List<String>> getDimancheFromDB() async{
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('MenuDimanche');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return maps[i]['nom'];
    });
  }

  Future<void> deleteMenuFromLundi(String name) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'MenuLundi',
      // Use a `where` clause to delete a specific dog.
      where: 'nom like ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [name],
    );
  }


}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menusemaine/repo/lists_menus_repo.dart';
import 'package:menusemaine/repo/semaines.repo.dart';
import 'package:menusemaine/services/file/file.dart';
import 'package:menusemaine/services/list_loading/list_loaded_cubit.dart';
import 'package:menusemaine/services/list_update/list_update_cubit.dart';
import 'package:menusemaine/services/tier_menu/tirer_menu_cubit.dart';
import 'package:menusemaine/view/screens/home_screen.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> main() async {



  WidgetsFlutterBinding.ensureInitialized();
// Open the database and store the reference.
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'menu_semaine.db'),

    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      // Create Table 1: MenuLundi
      db.execute(
        'CREATE TABLE MenuLundi(nom TEXT)',
      );

      // Create Table 2: MenuMardi
      db.execute(
        'CREATE TABLE MenuMardi(nom TEXT)',
      );

      // Create Table 3: MenuMercredi
      db.execute(
        'CREATE TABLE MenuMercredi(nom TEXT)',
      );

      // Create Table 4: MenuJeudi
      db.execute(
        'CREATE TABLE MenuJeudi(nom TEXT)',
      );

      // Create Table 5: MenuVendredi
      db.execute(
        'CREATE TABLE MenuVendredi(nom TEXT)',
      );

      // Create Table 6: MenuSamedi
      db.execute(
        'CREATE TABLE MenuSamedi(nom TEXT)',
      );

      // Create Table 7: MenuDimanche
      db.execute(
        'CREATE TABLE MenuDimanche(nom TEXT)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );



  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {

  final Future<Database> database;

  const MyApp({super.key, required this.database});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    ListsMenusRepository reposMenu = ListsMenusRepository(database);//db
    SemaineRepository repoSemaine = SemaineRepository(database);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ListLoadingCubit(reposMenu, repoSemaine)),
        BlocProvider(create: (context) => ListUpdateCubit(reposMenu)),
        BlocProvider(create: (context) => TirerMenuCubit(reposMenu, repoSemaine)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Menu de la semaine',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}


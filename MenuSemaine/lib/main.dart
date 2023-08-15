import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menusemaine/repo/lists_menus_repo.dart';
import 'package:menusemaine/services/add_menu/add_menu_bloc.dart';
import 'package:menusemaine/services/lists_updated/list_updated_bloc.dart';
import 'package:menusemaine/view/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    ListsMenusRepository repos = ListsMenusRepository();//db

    return MultiBlocProvider(
      providers: [
        BlocProvider<AddMenuBloc>(create: (context){
          return AddMenuBloc(repos);
        }),
        BlocProvider<ListUpdatedBloc>(lazy: false, create: (context){
          return ListUpdatedBloc(repos);
        }),
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


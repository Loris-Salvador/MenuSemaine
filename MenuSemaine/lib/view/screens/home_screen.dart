import 'package:flutter/material.dart';
import 'package:menusemaine/view/widgets/list_menus.dart';
import 'package:menusemaine/view/widgets/semaines/menus_possibles_semaine.dart';


import '../dialog/add_menu_dialog.dart';
import '../styles/text_styles.dart';
import '../widgets/semaines/semaine_widget.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu de la semaine"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Semaine Actuelle", style: CustomTextStyle.defaultTextStyle),
                SizedBox(height: 10.0,),
                SemaineWidget(),
                SizedBox(height: 10.0),
                Text("Semaine Suivante", style: CustomTextStyle.defaultTextStyle),
                SizedBox(height: 10.0),
                SemaineWidget(),
                SizedBox(height: 10.0),
                Text("Menus Possibles", style: CustomTextStyle.defaultTextStyle,),
                SizedBox(height: 10.0),
                MenusPossiblesSemaine(),
              ],
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {showAddDialog(context);},
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: const Icon(Icons.add, size: 37),
      ),
    );
  }
}

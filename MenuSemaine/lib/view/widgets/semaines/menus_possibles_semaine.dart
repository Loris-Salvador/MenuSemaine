import 'package:flutter/material.dart';
import 'package:menusemaine/view/widgets/list_menus.dart';
import 'package:menusemaine/view/widgets/containers/menus_possibles_container.dart';

import '../../../services/add_menu/add_menu_bloc.dart';
import '../../../services/lists_updated/list_updated_bloc.dart';




class MenusPossiblesSemaine extends StatelessWidget {

  const MenusPossiblesSemaine({super.key});



  @override
  Widget build(BuildContext context) {

    List<String> list = [];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget> [
          MenusPossiblesContainer(
            child:
             Column(
              children: [
                Text("Lundi", textAlign: TextAlign.center),
                Expanded(
                  child: ListMenus(myState: ListLundiUpdatedState(listLundi: list)),
                )
              ],
            ),
          ),
          MenusPossiblesContainer(
            child:
              Column(
              children: [
                Text("Mardi", textAlign: TextAlign.center),
                Expanded(
                  child: ListMenus(myState: ListMardiUpdatedState(listMardi: list),),
                )
              ],
            ),
          ),
          MenusPossiblesContainer(
            child:
              Column(
              children: [
                Text("Mercredi", textAlign: TextAlign.center),
                Expanded(
                  child: ListMenus(myState: ListMercrediUpdatedState(listMercredi: list),),
                )
              ],
            ),
          ),
          MenusPossiblesContainer(
            child:
             Column(
              children: [
                Text("Jeudi", textAlign: TextAlign.center),
                Expanded(
                  child: ListMenus(myState: ListJeudiUpdatedState(listJeudi: list),),
                )
              ],
            ),
          ),
          MenusPossiblesContainer(
            child:
             Column(
              children: [
                Text("Vendredi", textAlign: TextAlign.center),
                Expanded(
                  child: ListMenus(myState: ListVendrediUpdatedState(listVendredi: list),),
                )
              ],
            ),
          ),
          MenusPossiblesContainer(
            child:
             Column(
              children: [
                Text("Samedi", textAlign: TextAlign.center),
                Expanded(
                  child: ListMenus(myState:  ListSamediUpdatedState(listSamedi: list),),
                )
              ],
            ),
          ),
          MenusPossiblesContainer(
            child:
             Column(
              children: [
                Text("Dimanche", textAlign: TextAlign.center),
                Expanded(
                  child: ListMenus(myState: ListDimancheUpdatedState(listDimanche: list),),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

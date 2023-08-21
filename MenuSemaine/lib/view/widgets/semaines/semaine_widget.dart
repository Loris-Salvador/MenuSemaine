import 'package:flutter/material.dart';
import 'package:menusemaine/view/widgets/list_menus.dart';

import '../containers/menu_jour_container.dart';




class SemaineWidget extends StatelessWidget {

  final List<String>semaine;

  const SemaineWidget({super.key, required this.semaine});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MenuJourContainer(
            child:
             Column(
              children: [
                Text("Lundi", textAlign: TextAlign.center),
                Padding(
                  padding:EdgeInsets.fromLTRB(3, 10, 3, 0),
                  child: Text(semaine[0], textAlign: TextAlign.center),
                )
              ],
            ),
          ),
          MenuJourContainer(
            child:
            Column(
              children: [
                const Text("Mardi", textAlign: TextAlign.center),
                Padding(
                  padding:EdgeInsets.fromLTRB(3, 10, 3, 0),
                  child: Text(semaine[1], textAlign: TextAlign.center),
                )
              ],
            ),
          ),
          MenuJourContainer(
            child:
            Column(
              children: [
                const Text("Mercredi", textAlign: TextAlign.center),
                Padding(
                  padding:EdgeInsets.fromLTRB(3, 10, 3, 0),
                  child: Text(semaine[2], textAlign: TextAlign.center),
                )
              ],
            ),
          ),
          MenuJourContainer(
            child:
            Column(
              children: [
                const Text("Jeudi", textAlign: TextAlign.center),
                Padding(
                  padding:EdgeInsets.fromLTRB(3, 10, 3, 0),
                  child: Text(semaine[3], textAlign: TextAlign.center),
                )              ],
            ),
          ),
          MenuJourContainer(
            child:
            Column(
              children: [
                const Text("Vendredi", textAlign: TextAlign.center),
                Padding(
                  padding:EdgeInsets.fromLTRB(3, 10, 3, 0),
                  child: Text(semaine[4], textAlign: TextAlign.center),
                )              ],
            ),
          ),
          MenuJourContainer(
            child:
            Column(
              children: [
                const Text("Samedi", textAlign: TextAlign.center),
                Padding(
                  padding:EdgeInsets.fromLTRB(3, 10, 3, 0),
                  child: Text(semaine[5], textAlign: TextAlign.center),
                )              ],
            ),
          ),
          MenuJourContainer(
            child:
            Column(
              children: [
                const Text("Dimanche", textAlign: TextAlign.center),
                Padding(
                  padding:EdgeInsets.fromLTRB(3, 10, 3, 0),
                  child: Text(semaine[6], textAlign: TextAlign.center),
                )              ],
            ),
          ),
        ],
      ),
    );
  }
}

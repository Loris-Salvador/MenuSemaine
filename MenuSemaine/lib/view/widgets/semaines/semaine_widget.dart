import 'package:flutter/material.dart';
import 'package:menusemaine/view/widgets/list_menus.dart';

import '../containers/menu_jour_container.dart';




class SemaineWidget extends StatelessWidget {

  const SemaineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MenuJourContainer(
            child:
            const Column(
              children: [
                Text("Lundi", textAlign: TextAlign.center),
                Padding(
                  padding:EdgeInsets.fromLTRB(3, 10, 3, 0),
                  child: Text("poulet frites", textAlign: TextAlign.center),
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
                  child: Text("poulet frites", textAlign: TextAlign.center),
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
                  child: Text("poulet frites", textAlign: TextAlign.center),
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
                  child: Text("poulet frites", textAlign: TextAlign.center),
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
                  child: Text("poulet frites", textAlign: TextAlign.center),
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
                  child: Text("poulet frites", textAlign: TextAlign.center),
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
                  child: Text("poulet frites", textAlign: TextAlign.center),
                )              ],
            ),
          ),
        ],
      ),
    );
  }
}

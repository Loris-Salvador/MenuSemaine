import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menusemaine/services/list_update/list_update_cubit.dart';
import 'package:menusemaine/view/widgets/list_menus.dart';
import 'package:menusemaine/view/widgets/containers/menus_possibles_container.dart';

import '../../../repo/lists_menus_repo.dart';





class MenusPossiblesSemaine extends StatelessWidget {

  final ListsMenusRepository repo;

  const MenusPossiblesSemaine(this.repo, {super.key});



  @override
  Widget build(BuildContext context) {

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
                  child: BlocBuilder<ListUpdateCubit, ListUpdateState>(
                    buildWhen: (previous, current) => current is ListLundiUpdatedState,
                    builder: (context, state) {
                      return ListMenus(repo.Lundi);
                    },
                  ),
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
                  child: BlocBuilder<ListUpdateCubit, ListUpdateState>(
                    buildWhen: (previous, current) => current is ListMardiUpdatedState,
                    builder: (context, state) {
                      print("Mardi" + state.toString());
                      return ListMenus(repo.Mardi);
                    },
                  ),
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
                  child: ListMenus(repo.Mercredi),
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
                  child: ListMenus(repo.Jeudi),
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
                  child: ListMenus(repo.Vendredi),
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
                  child: ListMenus(repo.Samedi),
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
                  child: ListMenus(repo.Dimanche),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

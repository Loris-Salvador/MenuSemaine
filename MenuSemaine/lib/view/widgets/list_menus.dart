import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menusemaine/services/lists_updated/list_updated_bloc.dart';

class ListMenus extends StatelessWidget {

  final ListUpdatedState myState;

  ListMenus({Key? key, required this.myState}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> list = [];


    return BlocBuilder<ListUpdatedBloc, ListUpdatedState>(
      builder: (context, state) {

        print(state);
        if (state.runtimeType == myState.runtimeType) {
          print("YO");
          list = state.myList;
          print(list);
        }
        return ListView.builder(
          itemCount: list.length,
          itemExtent: 25, // Hauteur de chaque élément de la liste
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1), // Ajustez la valeur pour l'espacement vertical
              child: ListTile(
                title: Text(list[index]),
              ),
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menusemaine/view/styles/text_styles.dart';

import '../../services/list_update/list_update_cubit.dart';

class ListMenus extends StatelessWidget {

  final List<String> list;


  const ListMenus(this.list, {super.key});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
          itemCount: list.length, // Ajustez la valeur pour l'espacement vertical
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1), // Ajustez la valeur pour l'espacement vertical
              child:  Dismissible(
                background: Container(color: Colors.red),
                onDismissed: (direction) {
                  BlocProvider.of<ListUpdateCubit>(context).removeMenuToLundi(list[index].toString());
                },
                key: Key("$index-${DateTime.now().millisecondsSinceEpoch}"),
                child: ListTile(
                  title: Text(list[index]),
                ),
              )
            );
          },
        );
  }
}

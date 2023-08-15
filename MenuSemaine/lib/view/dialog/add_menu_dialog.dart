import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menusemaine/services/add_menu/add_menu_bloc.dart';

class AddMenuDialog extends StatefulWidget {
  @override
  _AddMenuDialogState createState() => _AddMenuDialogState();
}

class _AddMenuDialogState extends State<AddMenuDialog> {
  String selectedDay = 'Lundi'; // Jour sélectionné dans le menu déroulant
  TextEditingController menuNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Ajouter un menu'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DropdownButton<String>(
            value: selectedDay,
            onChanged: (String? newValue) {
              setState(() {
                selectedDay = newValue!;
              });
            },
            items: <String>[
              'Lundi',
              'Mardi',
              'Mercredi',
              'Jeudi',
              'Vendredi',
              'Samedi',
              'Dimanche',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: menuNameController,
            decoration: const InputDecoration(
              labelText: 'Nom du menu',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Annuler'),
        ),
        TextButton(
          onPressed: () {
            String selectedMenu = menuNameController.text;
            BlocProvider.of<AddMenuBloc>(context).add(
              AddMenuEvent(selectedMenu, selectedDay),
            );
            Navigator.pop(context);
          },
          child: Text('Ajouter'),
        ),
      ],
    );
  }
}

void showAddDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AddMenuDialog();
    },
  );
}

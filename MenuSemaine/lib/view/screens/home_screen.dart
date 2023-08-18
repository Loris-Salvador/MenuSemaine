import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menusemaine/services/list_loading/list_loaded_cubit.dart';

import '../dialog/add_menu_dialog.dart';
import '../styles/text_styles.dart';
import '../widgets/semaines/menus_possibles_semaine.dart';
import '../widgets/semaines/semaine_widget.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListLoadingCubit, ListLoadingState>(
        builder: (context, state) {
          if (state is ListUnloadedState) {
            return const Center(
                child: CircularProgressIndicator()
            );
          }

          else if (state is ListLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Menu de la semaine"),
                centerTitle: true,
                backgroundColor: Colors.blue,
              ),

              body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Semaine Actuelle",
                            style: CustomTextStyle.defaultTextStyle),
                        const SizedBox(height: 10.0,),
                        const SemaineWidget(),
                        const SizedBox(height: 10.0),
                        const Text("Semaine Suivante",
                            style: CustomTextStyle.defaultTextStyle),
                        const SizedBox(height: 10.0),
                        const SemaineWidget(),
                        const SizedBox(height: 10.0),
                        const Text("Menus Possibles",
                          style: CustomTextStyle.defaultTextStyle,),
                        const SizedBox(height: 10.0),
                        MenusPossiblesSemaine(state.repo),
                      ],
                    )
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  showAddDialog(context);
                },
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: const Icon(Icons.add, size: 37),
              ),
            );
          }

          else {
            return const Text("YO");
          }
        }
    );
  }
}

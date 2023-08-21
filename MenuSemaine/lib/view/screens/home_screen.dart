import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menusemaine/services/list_loading/list_loaded_cubit.dart';
import 'package:menusemaine/services/tier_menu/tirer_menu_cubit.dart';

import '../dialog/add_menu_dialog.dart';
import '../styles/text_styles.dart';
import '../widgets/semaines/menus_possibles_semaine.dart';
import '../widgets/semaines/semaine_widget.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> semaine = ["1", "2","3","4","5", "6", "7"];
    List<String> semaine2 = ["1", "2","3","4","5", "6", "7"];

    return BlocBuilder<ListLoadingCubit, ListLoadingState>(
        builder: (context, state) {
          if (state is ListUnloadedState) {
            return const Center(
                child: CircularProgressIndicator()
            );
          }

          else if (state is ListLoadedState) {
            semaine = state.repoSemaine.semaineSuivante.menu;
            semaine2 = state.repoSemaine.semaineAcutelle.menu;
            return Scaffold(
              appBar: AppBar(
                title: const Text("Menu de la semaine"),
                centerTitle: true,
                backgroundColor: Colors.blue,
              ),

              body:  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 60.0),
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Semaine Actuelle",
                            style: CustomTextStyle.defaultTextStyle),
                        const SizedBox(height: 10.0,),
                        SemaineWidget(semaine: semaine2,),
                        const SizedBox(height: 10.0),
                        const Text("Semaine Suivante",
                            style: CustomTextStyle.defaultTextStyle),
                        const SizedBox(height: 10.0),
                        BlocBuilder<TirerMenuCubit, TirerMenuState>(builder: (context, state) {
                          if(state is TirerMenuInitialState){
                            return SemaineWidget(semaine: semaine,);
                          }
                          else if(state is TirerMenuSuccess){
                            return SemaineWidget(semaine: state.semaineSuivante,);
                          }

                          else {
                            return const Text("ERREUR");
                          }

                        },),
                        const SizedBox(height: 8.0),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<TirerMenuCubit>(context).onButtonTirerMenuPressed();
                            },
                            child: Text('Tirer Menus'),
                          ),
                        ),
                        const SizedBox(height: 7.0),
                        const Text("Menus Possibles",
                          style: CustomTextStyle.defaultTextStyle,),
                        const SizedBox(height: 10.0),
                        Expanded(child: MenusPossiblesSemaine(state.repo)),
                      ],
                    )
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

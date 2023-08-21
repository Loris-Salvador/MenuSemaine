import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:menusemaine/services/file/file.dart';
import 'package:meta/meta.dart';

import '../../repo/lists_menus_repo.dart';
import '../../repo/semaines.repo.dart';

part 'tirer_menu_state.dart';

class TirerMenuCubit extends Cubit<TirerMenuState> {

  final ListsMenusRepository listsMenusRepository;
  final SemaineRepository semaineRepository;

  TirerMenuCubit(this.listsMenusRepository, this.semaineRepository) : super(TirerMenuInitialState());


  void onButtonTirerMenuPressed() async{
    Random random = Random();

    int indexLundi = random.nextInt(listsMenusRepository.Lundi.length);
    int indexMardi = random.nextInt(listsMenusRepository.Mardi.length);
    int indexMercredi = random.nextInt(listsMenusRepository.Mercredi.length);
    int indexJeudi = random.nextInt(listsMenusRepository.Jeudi.length);
    int indexVendredi = random.nextInt(listsMenusRepository.Vendredi.length);
    int indexSamedi = random.nextInt(listsMenusRepository.Samedi.length);
    int indexDimanche = random.nextInt(listsMenusRepository.Dimanche.length);

    semaineRepository.addSemaineSuivante(listsMenusRepository.Lundi[indexLundi], listsMenusRepository.Mardi[indexMardi], listsMenusRepository.Mercredi[indexMercredi], listsMenusRepository.Jeudi[indexJeudi], listsMenusRepository.Vendredi[indexVendredi], listsMenusRepository.Samedi[indexSamedi], listsMenusRepository.Dimanche[indexDimanche]);

    final file = await localFile;

    final json = semaineRepository.semaineSuivante.toJson(); // Convertir l'objet en JSON

    print("JSON");

    print(json.toString());

    file.writeAsStringSync(json.toString(), flush: true); // Écrire la chaîne JSON dans le fichier

    emit(TirerMenuSuccess(semaineRepository.semaineSuivante.menu));

  }
}

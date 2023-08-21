import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../repo/lists_menus_repo.dart';
import '../../repo/semaines.repo.dart';
import 'package:path_provider/path_provider.dart';

import '../file/file.dart';


part 'list_loaded_state.dart';

class ListLoadingCubit extends Cubit<ListLoadingState> {

  final ListsMenusRepository reposMenu;
  final SemaineRepository repoSemaine;


  ListLoadingCubit(this.reposMenu, this.repoSemaine) : super(ListUnloadedState()){
    _loadList();



  }

  _loadList() async {
    await reposMenu.initialize();
    await repoSemaine.initialize();
    emit(ListLoadedState(reposMenu, repoSemaine));
  }




}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../repo/lists_menus_repo.dart';

part 'list_loaded_state.dart';

class ListLoadingCubit extends Cubit<ListLoadingState> {

  final ListsMenusRepository repo;

  ListLoadingCubit(this.repo) : super(ListUnloadedState()){
    _loadList();
  }

  _loadList() async {
    await repo.initialize();
    //await Future.delayed(const Duration(seconds: 5));
    print(repo.Lundi);
    emit(ListLoadedState(repo));
  }
}

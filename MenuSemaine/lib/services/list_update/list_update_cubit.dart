import 'package:bloc/bloc.dart';
import 'package:menusemaine/repo/lists_menus_repo.dart';
import 'package:meta/meta.dart';

part 'list_update_state.dart';

class ListUpdateCubit extends Cubit<ListUpdateState> {

  final ListsMenusRepository repo;

  ListUpdateCubit(this.repo) : super(ListUpdateInitialState());


  void addMenuToLundi(String day, String menuName) {
    repo.addLundi(menuName);
    emit(ListLundiUpdatedState());
  }

  void removeMenuToLundi(String menuName) {
    repo.removeLundi(menuName);
    emit(ListLundiUpdatedState());
  }
}

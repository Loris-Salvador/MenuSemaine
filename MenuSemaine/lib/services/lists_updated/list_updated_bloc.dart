import 'package:bloc/bloc.dart';
import 'package:menusemaine/repo/lists_menus_repo.dart';
import 'package:meta/meta.dart';

part 'list_updated_event.dart';
part 'list_updated_state.dart';

class ListUpdatedBloc extends Bloc<ListUpdatedEvent, ListUpdatedState> {
  
  ListsMenusRepository _repo;
  
  ListUpdatedBloc(this._repo) : super(ListUpdatedInitial()) {

    _repo.lundiStream.listen((event) {
      add(ListLundiUpdateEvent());
    });
    
    on<ListLundiUpdateEvent>((event, emit) {

      print("EMIT");

      print(_repo.Lundi);

      print("OF");

      emit(ListLundiUpdatedState(listLundi: _repo.Lundi));

    });
  }
}

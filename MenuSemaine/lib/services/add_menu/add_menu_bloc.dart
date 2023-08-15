import 'package:bloc/bloc.dart';
import 'package:menusemaine/repo/lists_menus_repo.dart';
import 'package:meta/meta.dart';

part 'add_menu_event.dart';
part 'add_menu_state.dart';

class AddMenuBloc extends Bloc<AddMenuEvent, AddMenuState> {

  final ListsMenusRepository repo;


  AddMenuBloc(this.repo) : super(AddMenuInitial()) {

    on<AddMenuEvent>((event, emit) {

       print("Day $event.day");

        if(event.day == 'Lundi')
        {
            print("Lundi");
            repo.addLundi(event.menuName);
        }
    });
  }
}

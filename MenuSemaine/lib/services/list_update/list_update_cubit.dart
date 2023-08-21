import 'package:bloc/bloc.dart';
import 'package:menusemaine/repo/lists_menus_repo.dart';
import 'package:meta/meta.dart';

part 'list_update_state.dart';

class ListUpdateCubit extends Cubit<ListUpdateState> {

  final ListsMenusRepository repo;

  ListUpdateCubit(this.repo) : super(ListUpdateInitialState());


 void addMenu(String day, String menuName)
 {
   if(day == "Lundi"){
     repo.addLundi(menuName);
      emit(ListLundiUpdatedState());
   }
    else if(day == "Mardi"){
      repo.addMardi(menuName);
      emit(ListMardiUpdatedState());
    }
    else if(day == "Mercredi"){
      repo.addMercredi(menuName);
      emit(ListMercrediUpdatedState());
    }
    else if(day == "Jeudi"){
      repo.addJeudi(menuName);
      emit(ListJeudiUpdatedState());
    }
    else if(day == "Vendredi"){
      repo.addVendredi(menuName);
      emit(ListVendrediUpdatedState());
    }
    else if(day == "Samedi"){
      repo.addSamedi(menuName);
      emit(ListSamediUpdatedState());
    }
    else if(day == "Dimanche"){
      repo.addDimanche(menuName);
      emit(ListDimancheUpdatedState());
    }
 }

  void removeMenu(String day, String menuName) {
      if(day == "Lundi"){
        repo.removeLundi(menuName);
        emit(ListLundiUpdatedState());
      }
      else if(day == "Mardi"){
        print("OK");
        repo.removeMardi(menuName);
        emit(ListMardiUpdatedState());
      }
      else if(day == "Mercredi"){
        repo.removeMercredi(menuName);
        emit(ListMercrediUpdatedState());
      }
      else if(day == "Jeudi"){
        repo.removeJeudi(menuName);
        emit(ListJeudiUpdatedState());
      }
      else if(day == "Vendredi"){
        repo.removeVendredi(menuName);
        emit(ListVendrediUpdatedState());
      }
      else if(day == "Samedi"){
        repo.removeSamedi(menuName);
        emit(ListSamediUpdatedState());
      }
      else if(day == "Dimanche"){
        repo.removeDimanche(menuName);
        emit(ListDimancheUpdatedState());
      }
  }
}

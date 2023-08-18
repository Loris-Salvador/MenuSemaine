part of 'list_loaded_cubit.dart';

@immutable
abstract class ListLoadingState {}

class ListUnloadedState extends ListLoadingState {}

class ListLoadedState extends ListLoadingState {

  final ListsMenusRepository repo;

    ListLoadedState(this.repo);
}


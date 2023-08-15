part of 'list_updated_bloc.dart';

@immutable
abstract class ListUpdatedState {
  List<String> get myList; // Déclaration d'un getter abstrait

}

class ListUpdatedInitial extends ListUpdatedState {
  @override
  final List<String> t = [];

  List<String> get myList => t;
}

class ListLundiUpdatedState extends ListUpdatedState {
  final List<String> listLundi;

  ListLundiUpdatedState({required this.listLundi});

  @override
  List<String> get myList => listLundi;
}

class ListMardiUpdatedState extends ListUpdatedState {
  final List<String> listMardi;

  ListMardiUpdatedState({required this.listMardi});

  @override
  List<String> get myList => listMardi;
}

class ListMercrediUpdatedState extends ListUpdatedState {
  final List<String> listMercredi;

  ListMercrediUpdatedState({required this.listMercredi});

  @override
  List<String> get myList => listMercredi;
}

class ListJeudiUpdatedState extends ListUpdatedState {
  final List<String> listJeudi;

  ListJeudiUpdatedState({required this.listJeudi});

  @override
  List<String> get myList => listJeudi;
}

class ListVendrediUpdatedState extends ListUpdatedState {
  final List<String> listVendredi;

  ListVendrediUpdatedState({required this.listVendredi});

  @override
  List<String> get myList => listVendredi;
}

class ListSamediUpdatedState extends ListUpdatedState {
  final List<String> listSamedi;

  ListSamediUpdatedState({required this.listSamedi});

  @override
  List<String> get myList => listSamedi;

}

class ListDimancheUpdatedState extends ListUpdatedState {
  final List<String> listDimanche;

  ListDimancheUpdatedState({required this.listDimanche});

  @override
  List<String> get myList => listDimanche;
}

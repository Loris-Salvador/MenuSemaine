import 'dart:async';

class ListsMenusRepository
{
  final List<String> Lundi = [];
  final List<String> Mardi = [];
  final List<String> Mercredi = [];
  final List<String> Jeudi = [];
  final List<String> Vendredi = [];
  final List<String> Samedi = [];
  final List<String> Dimanche = [];

  StreamController<List<String>> streamControllerLundi = StreamController<List<String>>();

  Stream<List<String>> get lundiStream => streamControllerLundi.stream;

  void addLundi(String menuName)
  {
      Lundi.add(menuName);

      print(Lundi[0].toString());
      print("EST CE QUE C4EST BON POUR VOUS?");

      streamControllerLundi.add(Lundi);
  }


  ListsMenusRepository()
  {
    print("CONSTRUCTOR");
    streamControllerLundi.add(Lundi);
  }

}
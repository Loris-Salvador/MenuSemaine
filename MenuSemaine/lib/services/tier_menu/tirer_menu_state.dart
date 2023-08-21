part of 'tirer_menu_cubit.dart';

@immutable
abstract class TirerMenuState {}

class TirerMenuInitialState extends TirerMenuState {}

class TirerMenuSuccess extends TirerMenuState {

  final List<String> semaineSuivante;

  TirerMenuSuccess(this.semaineSuivante);
}

part of 'list_updated_bloc.dart';

@immutable
abstract class ListUpdatedEvent {}

class ListLundiUpdateEvent extends ListUpdatedEvent {}

class ListMardiUpdateEvent extends ListUpdatedEvent {}

class ListMercrediUpdateEvent extends ListUpdatedEvent {}

class ListJeudiUpdateEvent extends ListUpdatedEvent {}

class ListVendrediUpdateEvent extends ListUpdatedEvent {}

class ListSamediUpdateEvent extends ListUpdatedEvent {}

class ListDimancheUpdateEvent extends ListUpdatedEvent {}

import 'package:equatable/equatable.dart';

abstract class FilmsEvent extends Equatable {
  const FilmsEvent();
}

class OnStart extends FilmsEvent {
  @override
  List<Object> get props => [];
}

class OnRefresh extends FilmsEvent {
  @override
  List<Object> get props => [];
}
class OnToggleFavorite extends FilmsEvent {
  final String id;

  const OnToggleFavorite(this.id);

  @override
  List<Object> get props => [id];
}
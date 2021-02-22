import 'package:equatable/equatable.dart';
import 'package:surf_cinema/layers/models/ui/film.dart';

abstract class FilmsState extends Equatable {
  const FilmsState();
}

class FilmsInitial extends FilmsState {
  @override
  List<Object> get props => [];
}

class LoadingState extends FilmsState {
  @override
  List<Object> get props => [];
}

class RefreshingState extends LoadedState {
  const RefreshingState(List<FilmUiModel> list)
      : super(list);
}

class LoadingErrorState extends FilmsState {
  final Object error;
  final StackTrace stackTrace;

  const LoadingErrorState(
    this.error,
    this.stackTrace,
  );

  @override
  List<Object> get props => [error];
}

class LoadedState extends FilmsState {
  final List<FilmUiModel> list;

  const LoadedState(this.list);

  @override
  List<Object> get props => [list];
}

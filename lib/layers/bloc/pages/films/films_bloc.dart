import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:surf_cinema/layers/services/domain/films.dart';

import 'bloc.dart';

class FilmsBloc extends Bloc<FilmsEvent, FilmsState> {
  final FilmsService filmsService;

  FilmsBloc(
    this.filmsService,
  ) : super(FilmsInitial());

  @override
  Stream<FilmsState> mapEventToState(
    FilmsEvent event,
  ) async* {
    if (event is OnStart){
      yield* _onStart();
    }
  }
  Stream<FilmsState> _onStart() async*{
    yield LoadingState();
    final list = await filmsService.discoverFilms(page: 1);
    yield LoadedState(list);
  }
}

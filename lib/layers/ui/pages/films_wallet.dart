import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:optional/optional.dart';
import 'package:surf_cinema/layers/bloc/pages/films/bloc.dart';
import 'package:surf_cinema/layers/bloc/pages/films/films_bloc.dart';
import 'package:surf_cinema/layers/models/ui/film.dart';
import 'package:surf_cinema/layers/services/domain/films.dart';
import 'package:surf_cinema/layers/ui/widgets/asset_image.dart';
import 'package:surf_cinema/layers/ui/widgets/bloc_refresh_indicator.dart';

FilmsBloc _bloc(BuildContext context) => BlocProvider.of(context);

class FilmsPageProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FilmsBloc(GetIt.instance<FilmsService>())..add(OnStart()),
      child: FilmsPage(),
    );
  }
}

class FilmsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmsBloc, FilmsState>(builder: (context, state) {
      if (state is LoadingState) {
        return LoadingIndicator();
      } else if (state is LoadedState) {
        return _Body(state);
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _Body extends StatelessWidget {
  final LoadedState state;

  const _Body(this.state, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ContentList(state.list);
  }
}

class _ContentList extends StatelessWidget {
  final List<FilmUiModel> list;

  const _ContentList(this.list, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlockRefreshIndicator<FilmsBloc, FilmsState>(
        onRefresh: () => _bloc(context).add(OnRefresh()),
        isRefreshingState: (state) => state is RefreshingState,
        child: ListView.builder(
          itemBuilder: (_, i) {
            final film = list[i];
            return _FilmItem(
              film: film,
            );
          },
          itemCount: list.length,
        ),
      ),
    );
  }
}

class _FilmItem extends StatelessWidget {
  final FilmUiModel film;

  const _FilmItem({Key key, this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white10,
          highlightColor: Colors.white10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // _FilmImage(
                //   posterPath: film.posterPath,
                // ),
                Column(
                  children: [
                    Text(
                      film.title,
                    ),
                    Text(
                      film.overview,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FilmImage extends StatelessWidget {
  final Optional<String> posterPath;

  const _FilmImage({Key key, this.posterPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return posterPath.isPresent
        ? SurfImage(
            height: 60,
            width: 20,
            url: posterPath.value,
          )
        : const Icon(Icons.error);
  }
}

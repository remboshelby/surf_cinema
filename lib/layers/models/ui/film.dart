import 'package:flutter/cupertino.dart';
import 'package:optional/optional.dart';

class FilmUiModel {
  final int id;
  final Optional<String> posterPath;
  final String title;
  final String overview;
  final DateTime releaseDate;

  FilmUiModel({
    @required this.id,
    @required this.posterPath,
    @required this.title,
    @required this.overview,
    @required this.releaseDate,
  })  : assert(id != null),
        assert(posterPath != null),
        assert(title != null),
        assert(id != null),
        assert(overview != null),
        assert(releaseDate != null);
}

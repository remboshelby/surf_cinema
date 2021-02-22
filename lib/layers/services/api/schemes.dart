import 'dart:convert';

import 'package:optional/optional.dart';
import 'package:serdes_json/annotations.dart';
import 'package:flutter/foundation.dart';
import 'package:surf_cinema/drivers/json.dart';
import 'package:surf_cinema/layers/exceptions/common.dart';

part 'schemes.g.dart';

@SerdesJson(convertToSnakeCase: true)
class FilmItemResponseScheme {
  int id;
  Optional<String> posterPath;
  bool adult;
  String overview;
  String releaseDate;
  String originalTitle;
  String originalLanguage;
  List<int> genreIds;
  String title;
  Optional<String> backdropPath;
  int popularity;
  int voteCount;
  bool video;
  int voteAverage;
}


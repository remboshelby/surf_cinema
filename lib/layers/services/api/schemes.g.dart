// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

class FilmItemResponse {
  final FilmItemResponseScheme $scheme = null;
  final int id;
  final Optional<String> posterPath;
  final bool adult;
  final String overview;
  final String releaseDate;
  final String originalTitle;
  final String originalLanguage;
  final List<int> genreIds;
  final String title;
  final Optional<String> backdropPath;
  final double popularity;
  final int voteCount;
  final bool video;
  final double voteAverage;

  FilmItemResponse({
    @required this.id,
    this.posterPath = const Optional.empty(),
    @required this.adult,
    @required this.overview,
    @required this.releaseDate,
    @required this.originalTitle,
    @required this.originalLanguage,
    @required this.genreIds,
    @required this.title,
    this.backdropPath = const Optional.empty(),
    @required this.popularity,
    @required this.voteCount,
    @required this.video,
    @required this.voteAverage,
  })  : assert(id != null),
        assert(posterPath != null),
        assert(adult != null),
        assert(overview != null),
        assert(releaseDate != null),
        assert(originalTitle != null),
        assert(originalLanguage != null),
        assert(genreIds != null),
        assert(title != null),
        assert(backdropPath != null),
        assert(popularity != null),
        assert(voteCount != null),
        assert(video != null),
        assert(voteAverage != null);

  FilmItemResponse.fromJson(Map<String, dynamic> json)
      : id = getJsonValue(json, 'id'),
        posterPath = getJsonValueOrEmpty(json, 'poster_path'),
        adult = getJsonValue(json, 'adult'),
        overview = getJsonValue(json, 'overview'),
        releaseDate = getJsonValue(json, 'release_date'),
        originalTitle = getJsonValue(json, 'original_title'),
        originalLanguage = getJsonValue(json, 'original_language'),
        genreIds = getJsonList<int>(json, 'genre_ids'),
        title = getJsonValue(json, 'title'),
        backdropPath = getJsonValueOrEmpty(json, 'backdrop_path'),
        popularity = getJsonValue(json, 'popularity'),
        voteCount = getJsonValue(json, 'vote_count'),
        video = getJsonValue(json, 'video'),
        voteAverage = getJsonValue(json, 'vote_average') {
    require(id != null,
        () => SchemeConsistencyException('"id" should not be null'));
    require(posterPath != null,
        () => SchemeConsistencyException('"posterPath" should not be null'));
    require(adult != null,
        () => SchemeConsistencyException('"adult" should not be null'));
    require(overview != null,
        () => SchemeConsistencyException('"overview" should not be null'));
    require(releaseDate != null,
        () => SchemeConsistencyException('"releaseDate" should not be null'));
    require(originalTitle != null,
        () => SchemeConsistencyException('"originalTitle" should not be null'));
    require(
        originalLanguage != null,
        () => SchemeConsistencyException(
            '"originalLanguage" should not be null'));
    require(genreIds != null,
        () => SchemeConsistencyException('"genreIds" should not be null'));
    require(title != null,
        () => SchemeConsistencyException('"title" should not be null'));
    require(backdropPath != null,
        () => SchemeConsistencyException('"backdropPath" should not be null'));
    require(popularity != null,
        () => SchemeConsistencyException('"popularity" should not be null'));
    require(voteCount != null,
        () => SchemeConsistencyException('"voteCount" should not be null'));
    require(video != null,
        () => SchemeConsistencyException('"video" should not be null'));
    require(voteAverage != null,
        () => SchemeConsistencyException('"voteAverage" should not be null'));
  }

  Map<String, dynamic> toJson() {
    final $result = <String, dynamic>{};

    $result['id'] = id;

    if (posterPath.isPresent) {
      $result['poster_path'] = posterPath.value;
    }

    $result['adult'] = adult;
    $result['overview'] = overview;
    $result['release_date'] = releaseDate;
    $result['original_title'] = originalTitle;
    $result['original_language'] = originalLanguage;
    $result['genre_ids'] = genreIds.toList();
    $result['title'] = title;

    if (backdropPath.isPresent) {
      $result['backdrop_path'] = backdropPath.value;
    }

    $result['popularity'] = popularity;
    $result['vote_count'] = voteCount;
    $result['video'] = video;
    $result['vote_average'] = voteAverage;

    return $result;
  }

  String toStringJson() => jsonEncode(toJson());
  static FilmItemResponse fromStringJson(String json) =>
      FilmItemResponse.fromJson(jsonDecode(json));
}

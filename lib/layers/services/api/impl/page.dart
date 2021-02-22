import 'package:optional/optional.dart';
import 'package:surf_cinema/drivers/json.dart';
import 'package:surf_cinema/layers/exceptions/common.dart';

class Page<T> {
  final int totalResults;
  final int totalPages;
  final int page;
  final List<T> results;

  Page(
    this.totalResults,
    this.totalPages,
    this.page,
    this.results,
  )   : assert(totalResults != null),
        assert(totalPages != null),
        assert(page != null),
        assert(results != null);

  bool get hasNextPage {
    return page == totalPages;
  }

  // ignore: lines_longer_than_80_chars
  Page.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) factory,
  )   : totalResults = getJsonValue(json, 'total_results'),
        totalPages = getJsonValue(json, 'total_pages'),
        page = getJsonValue(json, 'page'),
        results = transformJsonListOfMap(json, 'results', (it) => factory(it)) {
    require(
      totalResults != null,
      () => SchemeConsistencyException('"totalResults" should not be null'),
    );
    require(
      totalPages != null,
      () => SchemeConsistencyException('"totalPages" should not be null'),
    );
    require(
      page != null,
      () => SchemeConsistencyException('"page" should not be null'),
    );
    require(
      results != null,
      () => SchemeConsistencyException('"results" should not be null'),
    );
  }
}

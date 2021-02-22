abstract class ApiGateway {
  Future<void> discoverFilms();

  Future<void> searchFilms(String keyWord);
}
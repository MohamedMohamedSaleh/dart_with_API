import 'package:dart_with_api/movie/movie_model.dart';
import 'package:dio/dio.dart';

class MoviesController {
  Future<void> getDataOfMovie() async {
/*     var response = await Dio(BaseOptions(
      baseUrl: "https://api.themoviedb.org/3/",
    )).get(
      "movie/popular",
      queryParameters: {"api_key": "bcf2553429a6cf5dfbbb7427841b8530"},
    ); */
    var response = await Dio().get(
      "https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd",
    );
    AllMoviesData model = AllMoviesData.fromJson(response.data);
    print(model.results[0].popularity);
  }
}

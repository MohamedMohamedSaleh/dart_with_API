

class AllMoviesData {
  late int page, totalPages, totalResults;
  late List<MovieData> results;

  AllMoviesData.fromJson(Map<String, dynamic> map) {
    page = map["page"]??0;
    totalPages = map["total_pages"]??0;
    totalResults = map["total_results"]?? 0;
    results = List.from(map["results"]).map((e) => MovieData.fromJson(e)).toList();
  }
}

class MovieData {
  late bool adult;
  late String image;
  late List<int> type;
  late int id;
  late String lang;
  late String title;
  late String overView;
  late double popularity;
  late String date;
  late double voteAverage;
  late int votecount;

  MovieData.fromJson(Map<String, dynamic> map) {
    adult = map["adult"] ?? false;
    image = map["backdrop_path"] ?? "";
    title = map["original_title"] ?? "";
    type = map["genre_ids"]?? [];
    id = map["id"] ?? 0;
    lang = map["original_language"]?? "";
    overView = map["overview"] ?? "";
    popularity = double.tryParse(map["popularity"].toString()) ?? 0;
    date = map["release_date"] ?? "";
    voteAverage = double.tryParse(map["vote_average"].toString()) ?? 0;
    votecount = map["vote_count"] ?? 0;
  }
}

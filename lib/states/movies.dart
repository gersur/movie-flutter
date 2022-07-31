import 'package:movie_flutter/api/api.dart';
import 'package:movie_flutter/states/states.dart';

class StateMovies extends BaseState {
  MoviesNowPlaying? _nowPlaying;
  MoviesPopular? _popular;
  MoviesRecommendation? _recommendation;

  Future<MoviesNowPlaying> nowPlaying(BuildContext context,
      [bool refresh = false]) async {
    if (refresh || _nowPlaying == null) {
      _nowPlaying = await ProviderMovie.getNowPlaying(context);
    }
    return _nowPlaying!;
  }

  Future<MoviesPopular> popular(BuildContext context,
      [bool refresh = false]) async {
    if (refresh || _nowPlaying == null) {
      _popular = await ProviderMovie.getPopular(context);
    }
    return _popular!;
  }

  Future<MoviesRecommendation> recommendation(BuildContext context, int movieId,
      [bool refresh = false]) async {
    if (refresh || _nowPlaying == null) {
      _recommendation =
          await ProviderMovie.getRecommendations(context, movieId);
    }
    return _recommendation!;
  }
}

import 'package:flutter/material.dart';
import 'package:movie_flutter/api/api.dart';

class StateMovies with ChangeNotifier {
  MoviesNowPlaying? _nowPlaying;
  MoviesPopular? _popular;
  MoviesRecommendation? _recommendation;

  MoviesNowPlaying? get nowPlaying => _nowPlaying;
  MoviesPopular? get popular => _popular;
  MoviesRecommendation? get recommendation => _recommendation;

  void increment() {
    _count++;
    notifyListeners();
  }
}

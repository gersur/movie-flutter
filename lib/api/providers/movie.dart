// ignore_for_file: use_build_context_synchronously

import 'package:movie_flutter/core/http/http.dart';

import './base_provider.dart';

class ProviderMovie extends BaseProvider {
  static Future<MoviesNowPlaying?> getNowPlaying(BuildContext context) async {
    try {
      Response response = await Http.get(':movie/now_playing');

      if (BaseProvider.clientValidate(context, response)) {
        Map body = jsonDecode(response.body);
        return MoviesNowPlaying.fromJson(body);
      }
    } on PlatformException catch (e) {
      BaseProvider.handleException(e, context);
    }
    return null;
  }

  static Future<MoviesPopular?> getPopular(BuildContext context) async {
    try {
      Response response = await Http.get(':movie/popular');

      if (BaseProvider.clientValidate(context, response)) {
        Map body = jsonDecode(response.body);
        return MoviesPopular.fromJson(body);
      }
    } on PlatformException catch (e) {
      BaseProvider.handleException(e, context);
    }
    return null;
  }

  static Future<MoviesRecommendation?> getRecommendations(
      BuildContext context, int movieId) async {
    try {
      Response response = await Http.get(':/movie/$movieId/recommendations');

      if (BaseProvider.clientValidate(context, response)) {
        Map body = jsonDecode(response.body);
        return MoviesRecommendation.fromJson(body);
      }
    } on PlatformException catch (e) {
      BaseProvider.handleException(e, context);
    }
    return null;
  }

  static Future<MovieDetail?> getDetail(
      BuildContext context, int movieId) async {
    try {
      Response response = await Http.get(':/movie/$movieId');

      if (BaseProvider.clientValidate(context, response)) {
        Map body = jsonDecode(response.body);
        return MovieDetail.fromJson(body);
      }
    } on PlatformException catch (e) {
      BaseProvider.handleException(e, context);
    }
    return null;
  }
}

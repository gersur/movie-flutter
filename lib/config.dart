class Config {
  static bool get isDebugMode {
    bool inDebugMode = false;
    assert(inDebugMode = true);
    return inDebugMode;
  }

  static const String baseUrl = 'https://api.tirtajaya.co.id/v1';
  static const String apiKey = 'fbb9572d11b5458ac98f02b84f2bafc4';
}

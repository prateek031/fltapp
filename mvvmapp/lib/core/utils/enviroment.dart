import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnviormentFile {
  static String get fileName {
    if (kReleaseMode) {
      return '.env.production';
    }
    return '.env.devlopment';
  }

  static String get apiUrl {
    return dotenv.env['API_URL'] ?? 'url not found';
  }
}

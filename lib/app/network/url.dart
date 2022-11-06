//import 'url_key_secret.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Url {
  //API key
  static String apiKey = dotenv.env['OPENAI_KEY'] ?? "";

  //Base URLs
  static const String baseUrl = 'https://api.openai.com/v1';

  static const String compilation = '/completions';
}

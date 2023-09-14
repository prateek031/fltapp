import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';

class UriLauncher {
  launchURL() async {
    final url = Uri.parse(dotenv.env['API_URL'].toString());
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    } else {
      throw 'Could not launch $url';
    }
  }
}

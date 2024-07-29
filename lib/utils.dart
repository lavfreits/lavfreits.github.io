import 'package:url_launcher/url_launcher_string.dart';

void launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Não foi possível abrir a URL: $url';
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:portifolio/model/localization.dart';

class LocalizationService {
  static const String _url =
      "https://gist.githubusercontent.com/lavfreits/82a4acf1b5e63f6e409cce710d599676/raw/753703322605d2df455943ec41de597d03f42fbe/localization.json";

  Future<Localization> fetchLocalizationData(String localization) async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Localization.fromJson(data, localization);
    } else {
      throw Exception('Failed to load localization data');
    }
  }
}

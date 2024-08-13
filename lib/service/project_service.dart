import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/project.dart';

class LocalizationService {
  static const String _url =
      'https://gist.githubusercontent.com/lavfreits/81750a2eb6a2484a7fee49cfd1bddead/raw/project.json';

  Future<List<Project>> fetchLocalizationData(String localization) async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['projects'] as List)
          .map((json) => Project.fromJson(json, localization))
          .toList();
    } else {
      throw Exception('Failed to load projects');
    }
  }
}

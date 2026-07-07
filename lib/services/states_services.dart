import 'dart:convert';

import 'package:covid_app/models/world_states_model.dart';
import 'package:covid_app/services/utilities/app_urls.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStatesModel> getWorldState() async {
    final response = await http.get(Uri.parse(AppUrls.worldStatesApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> getCountriesList() async {
    var data;
    final response = await http.get(Uri.parse(AppUrls.countriesListApi));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception('Error');
    }
  }
}

import 'package:flutter/foundation.dart';
import 'package:mug_app/models/mug_news_model.dart'; // Import your model class
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/app_constants.dart';

class MugNewsProvider extends ChangeNotifier {
  List<MugNewsModel> _newsList = [];

  // Getter for the news list
  List<MugNewsModel> get newsList => _newsList;

  // Method to fetch news data from the API
  Future<void> fetchNews() async {
    try {
      print(AppConstants.MUG_REST_API);
      final response = await http.get(Uri.parse("${AppConstants.MUG_REST_API_NEWS}")); // Replace with your API URL
      print(response);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        // print("NEWS oooooh");
        print(data);

        _newsList = data.map((item) => MugNewsModel.fromJson(item)).toList();
        // print(_newsList);

        notifyListeners();
      } else {
        throw Exception('Failed to load news');
      }
    } catch (error) {
      // print(error);
      throw error;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/post_model.dart';
import '../utils/app_constants.dart';

 // Import your PostalModel here

class PostalProvider extends ChangeNotifier {
  List<PostalModel> postalData = [];

  Future<void> fetchData() async {
    final url = Uri.parse("${AppConstants.MUG_REST_API_POSTAL}"); // Replace with your API URL

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        postalData = jsonData.map((e) => PostalModel.fromJson(e)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw error;
    }
  }
}

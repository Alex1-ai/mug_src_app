import 'package:flutter/material.dart';
// import 'package:your_app/models/position.dart'; // Replace with the correct import path for your Position class
import 'package:http/http.dart' as http; // If you are using HTTP for data fetching
import 'dart:convert';

import '../models/position_model.dart';
import '../utils/app_constants.dart';

class PositionProvider with ChangeNotifier {
  List<Position> _positions = [];

  List<Position> get positions => _positions;

  Future<void> fetchPositions() async {
    // Your data fetching logic here, for example using HTTP

    final url = Uri.parse('${AppConstants.MUG_REST_API_CANDIDATES_POSITIONS}'); // Replace with your API endpoint

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _positions = data.map((item) => Position.fromJson(item)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to fetch positions from the API');
      }
    } catch (error) {
      throw error;
    }
  }
}

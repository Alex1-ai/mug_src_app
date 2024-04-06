import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mug_app/utils/app_constants.dart';
import 'dart:convert';

import '../models/timetable_model.dart';

class TimetableProvider extends ChangeNotifier {
  List<TimetableItemModel> _timetableItems = [];

  List<TimetableItemModel> get timetableItems => _timetableItems;

  final String apiUrl = "YOUR_API_URL_HERE"; // Replace with your API URL

  Future<void> fetchTimetableItems() async {
    try {
      final response = await http.get(Uri.parse("${AppConstants.MUG_REST_API_TIMETABLE}"));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _timetableItems = data.map((item) => TimetableItemModel.fromJson(item)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}

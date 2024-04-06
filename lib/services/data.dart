import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mug_app/utils/app_constants.dart';

import '../models/position_model.dart';
class Data {
  //  String url ="https://library.mug.edu.gh/";
   Future<void> getLibrary() async{


    String url = "${AppConstants.MUG_LIBRARY_PAGE}";
    // String url = "https://library.mug.edu.gh/";
    Uri uri = Uri.parse(url); // Convert the String URL to a Uri
    var response = await http.get(uri);

    // Handle the response as needed
    print(response.statusCode);
    print(response.body);






  }

    Future<List<Position>> fetchPositions() async {
    final response = await http.get(Uri.parse('${AppConstants.MUG_REST_API_CANDIDATES_POSITIONS}'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Position.fromJson(data)).toList();
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load positions');
    }
  }





}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mug_app/utils/app_constants.dart';
import 'dart:convert';

import '../models/candidate_model.dart';
import '../utils/dimensions.dart';


class CandidateProvider with ChangeNotifier {
  List<CandidateModel> _candidates = [];

  List<CandidateModel> get candidates => _candidates;

  Future<void> fetchData() async {
    final url = Uri.parse(AppConstants.MUG_REST_API_CANDIDATES_CONTESTING); // Replace with your API URL

    try {
      final response = await http.get(url);
      print(response);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _candidates = data.map((item) => CandidateModel(
          id: item['id'],
          name: item['name'],
          image: item['image'],
          votes: item['votes'],
          department: item['department'],
          position: item['position'],
        )).toList();
         print(data);
        // Notify listeners that the data has changed
        notifyListeners();
      } else {
        // Handle error if the API request fails
        throw Exception('Failed to fetch data from the API');
      }
    } catch (error) {
      // Handle other exceptions, e.g., network issues
      throw error;
    }
  }

  // Method to update candidate data (e.g., voting)
  void updateCandidate(int candidateId) {
    // Find the candidate by ID and update their data
    final candidate = _candidates.firstWhere((c) => c.id == candidateId);
    // Perform the update (e.g., increment votes)
    candidate.votes++;
    
    // Notify listeners that the data has changed
    notifyListeners();
  }

  double calculatePercentage(int candidateId) {
    // Find the candidate by ID
    final candidate = _candidates.firstWhere((c) => c.id == candidateId);

    // Calculate the total number of votes cast for all candidates
    final totalVotes = _candidates.fold(
        0, (sum, candidate) => sum + candidate.votes);

    // Calculate the percentage for the candidate
    final percentage = (candidate.votes / totalVotes) * Dimensions.width20 * 10.9;
    // final percentage = (candidate.votes / totalVotes) * 208;

    return percentage;
  }

  Future<void> castVote(List<CandidateModel> selectedCandidates, String email) async {
    final url = Uri.parse(AppConstants.MUG_REST_API_CAST_VOTE); // Replace with your vote casting API endpoint URL

    try {
      final List<int> candidateIds = selectedCandidates.map((candidate) => candidate.id).toList();

      final Map<String, dynamic> requestBody = {
        'candidate_ids': candidateIds,
        'email': email,
      };

      final response = await http.post(
        url,
        body: json.encode(requestBody),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 201) {
        // Increment the vote counts for selected candidates on the UI
        for (final candidate in selectedCandidates) {
          candidate.votes++; // Increment the vote count locally
        }

        // Notify listeners to trigger a UI update
        notifyListeners();

        print('Vote cast successfully');
      } else {
        // Handle errors, e.g., if the API request fails or returns an error status code
        print(response);
        throw Exception('Failed to cast vote');
      }
    } catch (error) {
      // Handle other exceptions, e.g., network issues
      print(error);
      throw error;
    }
}

  // Future<void> castVote(List<CandidateModel> selectedCandidates, String email) async {
  //   final url = Uri.parse(AppConstants.MUG_REST_API_CAST_VOTE); // Replace with your vote casting API endpoint URL

  //   try {
  //     final List<int> candidateIds = selectedCandidates.map((candidate) => candidate.id).toList();

  //     final Map<String, dynamic> requestBody = {
  //       'candidate_ids': candidateIds,
  //       'email': email,
  //     };

  //     final response = await http.post(
  //       url,
  //       body: json.encode(requestBody),
  //       headers: {
  //         'Content-Type': 'application/json',
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       // Handle a successful vote cast response (if needed)
  //       print('Vote cast successfully');
  //     } else {
  //       // Handle errors, e.g., if the API request fails or returns an error status code
  //       throw Exception('Failed to cast vote');
  //     }
  //   } catch (error) {
  //     // Handle other exceptions, e.g., network issues
  //     throw error;
  //   }
  // }

}

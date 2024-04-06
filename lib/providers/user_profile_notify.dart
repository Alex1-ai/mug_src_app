import 'package:flutter/material.dart';

// import 'pamug_app/helpers/accountAuth.dart';
import 'package:mug_app/models/user_profile_model.dart';

import '../services/accountAuth.dart';


class UserProfileProvider with ChangeNotifier {
  UserProfileModel? _userProfile;
  final AccountAuth _accountAuth;

  UserProfileProvider(this._accountAuth);

  // Getter for the user profile
  UserProfileModel? get userProfile => _userProfile;

  // Method to fetch the user profile
  Future<void> fetchUserProfile() async {
    final userProfile = await _accountAuth.fetchUserProfile();
    if (userProfile != null) {
      print(userProfile, );
      _userProfile = userProfile;
      notifyListeners();
    }
  }

  // METHOD TO UPLOAD IMAGE
   Future<String> updateUserProfileImage(var imageFile, String userId, String oldImageUrl) async {
    try {
      // Call the uploadUserProfileImage function to handle image upload and update
      final imageUrl = await _accountAuth.uploadUserProfileImage(imageFile, userId, oldImageUrl);

      // Update your local state or user profile data with the new image URL
      // For example:
      userProfile!.profileImage = imageUrl;
      
      // Notify listeners to trigger a UI update
      notifyListeners();

      return imageUrl;
    } catch (e) {
      print('Error updating profile image: $e');
      return 'error';
    }
  }

  // Method to update the user profile
  Future<void> updateUserProfile({
    String? name,
    String? phone,
    String? course,
    String? level,
  }) async {
    try {
      if (_userProfile == null) {
        throw Exception("User profile not available");
      }

      // Update the local user profile
      if (name != null) _userProfile!.name = name;
      if (phone != null) _userProfile!.phone = phone;
      if (course != null) _userProfile!.course = course;
      if (level != null) _userProfile!.level = level;

      // Update the user profile in Firestore
      await _accountAuth.updateUserProfile(
        // uid: _accountAuth.getUserId(), // Pass the user ID from the model
        name: name,
        phone: phone,
        course: course,
        level: level,
      );

      // Notify listeners about the change
      notifyListeners();
    } catch (error) {
      print("Error updating user profile: $error");
    }
  }
}


import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/user_profile_model.dart';


class AccountAuth{

  final auth = FirebaseAuth.instance;


  String? getUserId() {
    final user = auth.currentUser;
    print(user);
    if (user != null) {
      return user.uid;
    } else {
      // User is not logged in
      return null; // You can handle this case as needed
    }
}

// DELETING A USER FROM THE APP
Future<void> deleteUserAccount(String userId, String password) async {
  try {
    // Get the current user
    User? user = auth.currentUser;

    if (user != null) {
      // Create a credential with the user's email and password
      AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!,
        password: password,
      );

      // Reauthenticate the user with the credential
      await user.reauthenticateWithCredential(credential);

      // Now, the user is reauthenticated, you can proceed to delete the account

      // Delete user document from Firestore
      await FirebaseFirestore.instance.collection('users').doc(userId).delete();

      // Delete user authentication account
      await user.delete();

      // Additional cleanup or data deletion logic as needed
    } else {
      print('User is null');
      throw Exception('Unable to delete account. User not found.');
    }
  } catch (e) {
    // print('Error deleting account: $e');
    throw Exception('Unable to delete account. Incorrect password or other error.');
  }
}
// FETCHING USER DATA HERE

Future<UserProfileModel?> fetchUserProfile() async {
  try {
    String? userId= auth.currentUser!.uid;
    // Reference to the 'users' collection in Firestore
    final userRef = FirebaseFirestore.instance.collection('users');

    // Query for the specific user using their UID
    final userDoc = await userRef.doc(userId).get();

    // Check if the user document exists
    if (userDoc.exists) {
      // Convert the document data to a UserProfile object
      final userProfile = UserProfileModel.fromMap(userDoc.data() as Map<String, dynamic>);
      return userProfile;
    } else {
      // User not found
      return null;
    }
  } catch (error) {
    // Handle any errors (e.g., network issues, Firestore errors)
    // print("Error fetching user profile: $error");
    return null;
  }
}


// Future<String> uploadUserProfileImage(File imageFile, String userId) async {
Future<String> uploadUserProfileImage(var imageFile, String userId, String oldImageUrl) async {
  try {
    // Delete the old image if it exists
    if (oldImageUrl != null && oldImageUrl.isNotEmpty) {
      final Reference oldImageReference = FirebaseStorage.instance.refFromURL(oldImageUrl);
      await oldImageReference.delete();
    }

    // Upload the new image
    final Reference storageReference = FirebaseStorage.instance.ref().child('user_profile_images/$userId.jpg');
    final UploadTask uploadTask = storageReference.putFile(imageFile);
    await uploadTask.whenComplete(() => null);

    // Get the URL of the new image
    final String imageUrl = await storageReference.getDownloadURL();

    // Update the user document with the new image URL
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'profileImage': imageUrl,
    });

    print('Image uploaded successfully: $imageUrl');
    return imageUrl;
  } catch (e) {
    print('Error uploading image: $e');
    return 'error';
  }
}

// Future<String> uploadUserProfileImage(var imageFile, String userId) async {
//   try {
//     final Reference storageReference = FirebaseStorage.instance.ref().child('user_profile_images/$userId.jpg');
//     final UploadTask uploadTask = storageReference.putFile(imageFile);
//     await uploadTask.whenComplete(() => null);
//     final String imageUrl = await storageReference.getDownloadURL();
//     await FirebaseFirestore.instance.collection('users').doc(userId).update({
//       'profileImage': imageUrl,
//     });
//     print(imageUrl);
//     return imageUrl;
//   } catch (e) {
//     print('Error uploading image: $e');
//     // return null;
//     return 'error';
//   }
// }

Future<void> updateUserProfile({
  // required String uid,
  String? name,
  String? phone,
  String? course,
  String? level,
  // String? profilePicUrl,
}) async {
  String? uid = auth.currentUser!.uid;
  try {
    final userRef = FirebaseFirestore.instance.collection('users').doc(uid);
    final updateData = <String, dynamic>{};

    if (name != null) updateData['name'] = name;
    if (phone != null) updateData['phone'] = phone;
    if (course != null) updateData['course'] = course;
    if (level != null) updateData['level'] = level;
    // if (profilePicUrl != null) updateData['profilePicUrl'] = profilePicUrl;

    await userRef.update(updateData);
  } catch (error) {
    // Handle error
    print("Error updating user profile: $error");
  }
}


  Future<User>login({email, password})async{
    final UserCredential userCredential =await auth.signInWithEmailAndPassword(
            email: email,
            password: password,
          );


    final User user = userCredential.user!;

    return user;
  }
  Future<void>logout()async{
    await auth.signOut();
  }
  Future<void>resetPassword(email)async{
    await auth.sendPasswordResetEmail(email: email);
  }

  Future<void>register({email, password, name, phone})async{
    var userCredential= await auth.createUserWithEmailAndPassword(
            email: email, password: password,
            );
    print(userCredential);

    // Create a new Firestore document for the user with the UID as the document ID
    await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
      'email':email,
      'name': name,
      'phone': phone,
    });

          // await Provider.of<Auth>(context, listen: false)
          //     .signup(email, password);

          // Send email verification link
          await auth.currentUser!.sendEmailVerification();
  }






}
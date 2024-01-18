

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_ease/utils/constants/formatter.dart';

class UserModel{
  final String id;
  String firstName;
  String lastName;
  String phoneNumber;
  String profilePicture;
  final String userName;
  final String email;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
});
  String get fullName => '$firstName' '$lastName';
  String get formattedPhoneNo => Tformatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName)=> fullName.split(" ");

  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsename = '$firstName$lastName';
    String userNameWithPrefix = 'cwt_$camelCaseUsename';
    return userNameWithPrefix;
  }

  static UserModel empty() => UserModel(id: '', firstName: '', lastName: '', userName: '', email: '', phoneNumber: '', profilePicture:'');

    Map<String, dynamic> toJson(){
      return {
        'firstName' : firstName,
        'lastName' : lastName,
        'userName' : userName,
        'Email' : email,
        'PhoneNumber' : phoneNumber,
        'profilePicture' : profilePicture,
      };
    }
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        userName: data['userName'] ?? '',
        email: data['email'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        profilePicture: data['profilePicture'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
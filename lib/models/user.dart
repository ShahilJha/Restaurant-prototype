import '../enumerators.dart';

class User {
  int id;
  String userName;
  String email;
  String password;
  String contactNumber;
  String address;
  String gender;
  DateTime registrationDate;

  User({
    this.id,
    this.userName,
    this.email,
    this.password,
    this.contactNumber,
    this.address,
    this.gender,
    this.registrationDate,
  });
}

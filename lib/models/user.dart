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

class Waiter extends User {
  JobPosition jobPosition;

  Waiter({
    int id,
    String userName,
    String email,
    String password,
    String contactNumber,
    String address,
    String gender,
    DateTime registrationDate,
    this.jobPosition,
  }) : super(
          id: id,
          userName: userName,
          email: email,
          password: password,
          contactNumber: contactNumber,
          address: address,
          gender: gender,
          registrationDate: registrationDate,
        );
}

class Receptionist extends User {
  JobPosition jobPosition;

  Receptionist({
    int id,
    String userName,
    String email,
    String password,
    String contactNumber,
    String address,
    String gender,
    DateTime registrationDate,
    this.jobPosition,
  }) : super(
    id: id,
    userName: userName,
    email: email,
    password: password,
    contactNumber: contactNumber,
    address: address,
    gender: gender,
    registrationDate: registrationDate,
  );
}

class KitchenStaff extends User {
  JobPosition jobPosition;

  KitchenStaff({
    int id,
    String userName,
    String email,
    String password,
    String contactNumber,
    String address,
    String gender,
    DateTime registrationDate,
    this.jobPosition,
  }) : super(
    id: id,
    userName: userName,
    email: email,
    password: password,
    contactNumber: contactNumber,
    address: address,
    gender: gender,
    registrationDate: registrationDate,
  );
}

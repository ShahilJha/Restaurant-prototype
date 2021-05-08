import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/enum_util.dart';
import '../enumerators.dart';
import 'app_user.dart';

Receptionist receptionistFromMap(Map map) => Receptionist.fromMap(map);
Map<String, dynamic> receptionistToMap(Receptionist data) => data.toMap();

class Receptionist extends AppUser {
  JobPosition jobPosition;

  Receptionist({
    String id,
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

  //has no email and password
  factory Receptionist.fromMap(Map<String, dynamic> map) => Receptionist(
        id: map['id'],
        userName: map['userName'],
        contactNumber: map['contactNumber'],
        gender: map['gender'],
        address: map['address'],
        registrationDate: map['registrationDate'].toDate(),
        jobPosition: EnumUtil.stringToJobPosition(map['jobPosition']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'userName': userName,
        'contactNumber': contactNumber,
        'gender': gender,
        'address': address,
        'registrationDate': Timestamp.fromDate(registrationDate),
        'jobPosition': EnumUtil.jobPositionToString(jobPosition),
      };
}

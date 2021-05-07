import '../enumerators.dart';
import 'app_user.dart';

class Receptionist extends AppUser {
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

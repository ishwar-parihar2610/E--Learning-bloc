// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class RegisterEvents {
  RegisterEvents();
}

class RegisterDataEvents extends RegisterEvents {
  String userName;
  String emailAddress;
  String password;
  String confirmPassword;

  
  RegisterDataEvents({
    required this.userName,
    required this.emailAddress,
    required this.password,
    required this.confirmPassword,
  });
}

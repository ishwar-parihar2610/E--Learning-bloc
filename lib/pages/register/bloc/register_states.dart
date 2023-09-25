// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterStates {
  String userName;
  String emailAddress;
  String password;
  String confirmPassword;

  RegisterStates({
     this.userName="",
     this.emailAddress="",
     this.password="",
     this.confirmPassword="",
  });

  RegisterStates copyWith({
    String? userName,
    String? emailAddress,
    String? password,
    String? confirmPassword,
  }) {
    return RegisterStates(
      userName: userName ?? this.userName,
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
    
  }
}

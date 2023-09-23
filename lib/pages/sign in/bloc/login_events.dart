// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class SignInEvents {
  const SignInEvents();
}

class EmailEvent extends SignInEvents {
  final String email;
  EmailEvent({
    required this.email,
  });
}

class PasswordEvents extends SignInEvents {
  final String password;

  PasswordEvents({
    required this.password,
  });
}

class UserInformations {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  const UserInformations(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});
}

class LoginModel {
  final String email;
  final String password;

  const LoginModel({
    required this.email,
    required this.password,
  });
}

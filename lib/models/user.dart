class UserInformations {
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String clientTin;
  final String businessType;
  final String location;
  final String phoneNumber;
  final String password;

  const UserInformations(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.businessType,
      required this.clientTin,
      required this.username,
      required this.location,
      required this.phoneNumber,
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

class CustomerInformation {
  String names;
  String email;
  String password;

  CustomerInformation(
      {required this.names, required this.email, required this.password});
}

class CustomerBusiness {
  String tinNumber;
  String businessLocation;
  String productType;

  CustomerBusiness(
      {required this.tinNumber,
      required this.businessLocation,
      required this.productType});
}

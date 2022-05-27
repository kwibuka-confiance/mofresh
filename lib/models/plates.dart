class Plate {
  String id;
  String plateType;
  String storageCode; 
  String plateDescription;
  String maxTemperature;
  String buyPrice;
  String rentPrice;
  String platePicture;
  String storageName;

  Plate(
      {required this.id,
      required this.storageName,
      required this.plateDescription,
      required this.buyPrice,
      required this.rentPrice,
      required this.maxTemperature,
      required this.platePicture,
      required this.plateType,
      required this.storageCode});
}

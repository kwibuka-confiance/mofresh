class ColdBox {
  String id;
  String storageName;
  String mainPhoto;
  String provinceName;
  String districtName;
  String sectorName;
  String storageOverview;
  var tags;

  ColdBox(
      {required this.id,
      required this.tags,
      required this.districtName,
      required this.mainPhoto,
      required this.provinceName,
      required this.sectorName,
      required this.storageName,
      required this.storageOverview});
}

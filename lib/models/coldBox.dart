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

class BoxContainer {
  String id;
  String storageName;
  String mainPhoto;
  String description;

  BoxContainer(
      {required this.id,
      required this.mainPhoto,
      required this.storageName,
      required this.description});
}

List<BoxContainer> MOFRESH_BOX = [
  BoxContainer(
      id: '1',
      mainPhoto:
          "https://kivu.mofresh.rw/img/mS3zTr8t1xNqjXLfanoqAh9mGVFu9otwWmorhVnn.jpg",
      storageName: 'MoFresh Box',
      description: 'In publishing and graphic design, Lorem ipsum is a real '),
  BoxContainer(
      id: '1',
      mainPhoto:
          "https://kivu.mofresh.rw/box/qWMekFYf2WqSq42PAhhQPYB8hkRe3JyCaCkLrKYG.jpg",
      storageName: 'MoFresh Box',
      description: 'In publishing and graphic design, Lorem ipsum is a real '),
  BoxContainer(
      id: '1',
      mainPhoto:
          "https://kivu.mofresh.rw/img/mS3zTr8t1xNqjXLfanoqAh9mGVFu9otwWmorhVnn.jpg",
      storageName: 'MoFresh Box',
      description: 'In publishing and graphic design, Lorem ipsum is a '),
  BoxContainer(
      id: '1',
      mainPhoto:
          "https://kivu.mofresh.rw/box/qWMekFYf2WqSq42PAhhQPYB8hkRe3JyCaCkLrKYG.jpg",
      storageName: 'MoFresh Box',
      description: 'In publishing and graphic design, Lorem ipsum is a '),
];

List<BoxContainer> MOFRESH_FRIDGE = [
  BoxContainer(
      id: '1',
      mainPhoto:
          "https://kivu.mofresh.rw/box/2UrzT4MJTqDXq4TF6VPeI2PKgo1dSuPGpb1KOYIA.jpg",
      storageName: 'MoFresh Fridge',
      description: 'In publishing and graphic design, Lorem ipsum is a '),
  BoxContainer(
      id: '1',
      mainPhoto:
          "https://kivu.mofresh.rw/box/3fDoYqoqTCY76MOOvwJPwcze0tebeksjxhmbRoYy.jpg",
      storageName: 'MoFresh Fridge',
      description: 'In publishing and graphic design, Lorem ipsum is a '),
];

List<BoxContainer> MOFRESH_CONTAINERS = [
  BoxContainer(
      id: '1',
      mainPhoto:
          "https://kivu.mofresh.rw/box/iZbHsi7M68MXHq1UVK35X5vEDbI1pO6QBzjlOMSs.jpg",
      storageName: 'MoFresh Container',
      description: 'In publishing and graphic design, Lorem ipsum is a '),
  BoxContainer(
      id: '1',
      mainPhoto:
          "https://kivu.mofresh.rw/box/ajKsGIS7UrxvWD8Rrzp4t9LPBpvAl3aETIGKL3IK.jpg",
      storageName: 'MoFresh Container',
      description: 'In publishing and graphic design, Lorem ipsum is a '),
];

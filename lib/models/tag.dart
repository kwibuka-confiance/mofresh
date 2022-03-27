class Tag {
  String tagName;

  Tag({required this.tagName});
}

class TagSelectable {
  String tagName;
  String tagImage;
  TagSelectable({required this.tagName, required this.tagImage});
}

final List<Tag> tagList = [
  Tag(tagName: "Meats"),
  Tag(tagName: "Vegetables"),
  Tag(tagName: "Pharmaceuticals"),
];

List<TagSelectable> categoryList = [
  TagSelectable(
      tagName: "Vegetables",
      tagImage:
          "https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg"),
  TagSelectable(
      tagName: "Fruits",
      tagImage:
          "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/assortment-of-colorful-ripe-tropical-fruits-top-royalty-free-image-995518546-1564092355.jpg"),
  TagSelectable(
      tagName: "Meats",
      tagImage:
          "https://images.squarespace-cdn.com/content/v1/5c812e1b2727be1d59be0907/1584984891098-71YB1S4YX7OR7HIBV9K2/mixed+meat+3.PNG?format=2500w"),
  TagSelectable(
      tagName: "Medecine",
      tagImage: "https://www.eac.int/images/Press_Releases/medicines-l.jpg"),
  TagSelectable(
      tagName: "Pharmaceuticals",
      tagImage:
          "https://www.ceps.eu/wp-content/uploads/2021/07/Healthcare-and-pharmaceuticals-img-1300x731.jpg"),
];

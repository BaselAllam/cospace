

class CoSpaceModel {
  String id;
  String spaceName;
  String bio;
  bool isFav;
  List prices;
  List imgs;
  Map spaceLocation;

  CoSpaceModel({required this.id, required this.spaceName, required this.bio, required this.isFav, required this.prices, required this.imgs, required this.spaceLocation});

  factory CoSpaceModel.fromJson(String id, Map v, bool isFav) {
    return CoSpaceModel(
      id: id,
      spaceName: v['coSpaceName'],
      isFav: isFav,
      prices: v['prices'],
      imgs: v['imgs'],
      bio: v['bio'],
      spaceLocation: v['spaceLocation']
    );
  }
}
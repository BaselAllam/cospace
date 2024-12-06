import 'package:cospace/cospace/logic/cospace_model.dart';

class CoSpaceController {

  List<CoSpaceModel> _spaces = [
    CoSpaceModel(spaceName: 'Machinfy', rate: 4.7, isFav: false, price: 200, img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsF4Ii2dgdzrnorL6LaqjE5l2Osr0hFVVL2A&s'),
    CoSpaceModel(spaceName: 'CLS', rate: 4.8, isFav: true, price: 150, img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsF4Ii2dgdzrnorL6LaqjE5l2Osr0hFVVL2A&s'),
    CoSpaceModel(spaceName: 'ItShare', rate: 4.9, isFav: false, price: 300, img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsF4Ii2dgdzrnorL6LaqjE5l2Osr0hFVVL2A&s'),
  ];
  List<CoSpaceModel> get spaces => _spaces;

  List<CoSpaceModel> _favSpaces = [];
  List<CoSpaceModel> get favSpace => _favSpaces;

  void handleIsFav(CoSpaceModel cospaceModel, {int? favIndex}) {
    cospaceModel.isFav = !cospaceModel.isFav;
    if (cospaceModel.isFav) {
      _favSpaces.add(cospaceModel);
    } else {
      cospaceModel.isFav = false;
      _favSpaces.removeAt(favIndex!);
    }
  }
}
import 'dart:developer';

import 'package:cospace/cospace/logic/cospace_model.dart';
import 'package:cospace/cospace/logic/cospace_state.dart';
import 'package:cospace/shared/utils/app_assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CoSpaceCubit extends Cubit<CospaceState> {

  CoSpaceCubit() : super(CoSpaceInitState());

  List<CoSpaceModel> _spaces = [];
  List<CoSpaceModel> get spaces => _spaces;

  List<CoSpaceModel> _favSpaces = [];
  List<CoSpaceModel> get favSpace => _favSpaces;

  void handleIsFav(CoSpaceModel cospaceModel) {
    if (!cospaceModel.isFav) {
      cospaceModel.isFav = true;
      _favSpaces.add(cospaceModel);
    } else {
      cospaceModel.isFav = false;
      for (int i = 0; i < _favSpaces.length; i++) {
        if (_favSpaces[i].id == cospaceModel.id) {
          _favSpaces.removeAt(i);
          break;
        }
      }
    }
    emit(HandleIsFavState());
  }

  List<String> _banners = [];
  List<String> get banners => _banners;

  Future<void> getBanners () async {
    emit(GetBannersLoadingState());
    try {
      http.Response response = await http.get(Uri.parse('${AppAssets.domain}/banners.json'));
      if (response.statusCode == 200) {
        var resData = json.decode(response.body);
        resData.forEach((k, v) {
          _banners.add(v);
        });
        emit(GetBannersSuccessState());
      } else {
        emit(GetBannersErrorState());
      }
    } catch (e) {
      emit(GetBannersSomeThingWentWrongState());
    }
  }

  Future<void> getSpaces() async {
    emit(GetSpacesLoadingState());
    try {
      http.Response response = await http.get(Uri.parse('${AppAssets.domain}/cospaces.json'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        data.forEach((k, v) {
          _spaces.add(CoSpaceModel.fromJson(k, v));
        });
        log(_spaces.length.toString());
        emit(GetSpacesSuccessState());
      } else {
        emit(GetSpacesErrorState());
      }
    } catch (e) {
      log(e.toString());
      emit(GetSpacesSomeThingWentWrongState());
    }
  }
}
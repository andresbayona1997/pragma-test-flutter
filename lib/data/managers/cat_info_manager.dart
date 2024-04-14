import 'package:flutter_pragma/data/CatApi.dart';
import 'package:flutter_pragma/data/models/cat_info_model.dart';
import 'package:flutter_pragma/data/models/cat_photos_model.dart';

class CatInfoManager{
  static final get = CatInfoManager._();
  CatInfoManager._();

  final _catApi = CatApi.get;
  late CatInfoModel selectedCat;

  Future<List<CatInfoModel>> getAllCatInfo() async{
    final response = await _catApi.getApiInfo();
    final cats = response.data as List;
    return cats.map((g) => CatInfoModel.fromJson(g)).toList();
  }

  Future<List<CatPhotosModel>> getRandomCatsPhotosByBreedId(String breedId) async{
    final response = await _catApi.getRandomCatImageByBreedId(breedId);
    final cats = response.data as List;
    return cats.map((g) => CatPhotosModel.fromJson(g)).toList();
  }

}
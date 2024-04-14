
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pragma/data/models/cat_info_model.dart';
import '../../../data/managers/cat_info_manager.dart';
import '../../../data/models/cat_photos_model.dart';

part 'detail_cat_page_event.dart';
part 'detail_cat_page_state.dart';

class DetailCatPageBloc extends Bloc<DetailCatPageEvent, DetailCatPageState> {

  final _catApi = CatInfoManager.get;
  List<CatPhotosModel> catsPhotosInitial = [];
  late CatInfoModel selectedCat;
  List<String> photos = [];

  DetailCatPageBloc() : super(DetailCatPageInitial()) {
    on<LoadPhotoInfo>((event, emit) async{
      selectedCat = _catApi.selectedCat;
      catsPhotosInitial = await _catApi.getRandomCatsPhotosByBreedId(selectedCat.id);
      for(int i = 0; i < catsPhotosInitial.length; i++){
        photos.add(catsPhotosInitial[i].urlPhoto);
      }
      emit(DetailCatPageLoaded(catInfo: selectedCat, catPhotos: catsPhotosInitial, photos: photos));
    });
  }
}

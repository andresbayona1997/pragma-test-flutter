part of 'detail_cat_page_bloc.dart';

@immutable
sealed class DetailCatPageState extends Equatable{
  const DetailCatPageState();

  @override
  List<Object?> get props => [];
}

final class DetailCatPageInitial extends DetailCatPageState {}

class DetailCatPageLoaded extends DetailCatPageState{
  CatInfoModel catInfo;
  List<CatPhotosModel> catPhotos;
  List<String> photos;

  DetailCatPageLoaded({
    required this.catInfo,
    required this.catPhotos,
    required this.photos
});

  @override
  List<Object?> get props => [];
}

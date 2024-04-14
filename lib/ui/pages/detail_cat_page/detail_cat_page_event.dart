part of 'detail_cat_page_bloc.dart';

@immutable
sealed class DetailCatPageEvent extends Equatable{
  const DetailCatPageEvent();

  @override
  List<Object?> get props => [];
}
class LoadPhotoInfo extends DetailCatPageEvent{

}
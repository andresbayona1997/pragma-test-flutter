import 'package:equatable/equatable.dart';

class CatPhotosModel extends Equatable{
  String id;
  String urlPhoto;
  num width;
  num height;

  CatPhotosModel({
    required this.id,
    required this.urlPhoto,
    required this.width,
    required this.height
});

  static CatPhotosModel fromJson(Map<String, dynamic> json) => CatPhotosModel(
    id: json['id'] as String,
    urlPhoto: json['url'] as String,
    width: json['width'] as num,
    height: json['height'] as num
  );

  @override
  List<Object?> get props => [id, urlPhoto, width, height];
}
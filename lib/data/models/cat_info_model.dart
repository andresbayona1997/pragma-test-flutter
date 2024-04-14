import 'package:equatable/equatable.dart';

class CatInfoModel extends Equatable{
  String id;
  String name;
  String photoUrl;
  String origin;
  String description;
  String lifeSpan;
  num adaptability;
  num affectionLevel;
  num childFriendly;
  num dogFriendly;
  num energyLevel;
  num grooming;
  num intelligence;
  num socialNeeds;
  num strangerFriendly;
  bool hairless;
  bool natural;
  bool rare;
  bool suppressedTail;
  bool shortLegs;
  String moreInfo;
  bool hypoallergenic;
  String temperament;
  String weight;
  String country;
  String countryCode;
  CatInfoModel({
    required this.id,
    required this.name,
    required this.photoUrl,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.hairless,
    required this.hypoallergenic,
    required this.intelligence,
    required this.moreInfo,
    required this.natural,
    required this.rare,
    required this.shortLegs,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.suppressedTail,
    required this.temperament,
    required this.weight,
    required this.country,
    required this.countryCode
  });

  static CatInfoModel fromJson(Map<String, dynamic> json) => CatInfoModel(
      id: json['id'] as String,
      name: json['name'] as String,
      photoUrl: json['reference_image_id'] == null? "" : "https://cdn2.thecatapi.com/images/"+json['reference_image_id']+".jpg",
      //"https://cdn2.thecatapi.com/images/"+json['reference_image_id']+".jpg" as String?? "",
      origin: json['origin'] as String,
      description: json['description'] as String,
      lifeSpan: json['life_span'] as String,
      adaptability: json['adaptability'] as num,
      affectionLevel: json['affection_level'] as num,
      childFriendly: json['child_friendly'] as num,
      dogFriendly: json['dog_friendly'] as num,
      energyLevel: json['energy_level'] as num,
      grooming: json['grooming'] as num,
      hairless: json['hairless'] as num ==1 ? true:false,
      hypoallergenic: json['hypoallergenic'] as num ==1 ? true:false,
      intelligence: json['intelligence'] as num,
      moreInfo: json['wikipedia_url'] ?? "",
      natural: json['natural'] as num ==1 ? true:false,
      rare: json['rare'] as num ==1 ? true:false,
      shortLegs: json['short_legs'] as num ==1 ? true:false,
      socialNeeds: json['social_needs'] as num,
      strangerFriendly: json['stranger_friendly'] as num,
      suppressedTail: json['suppressed_tail'] as num ==1 ? true:false,
      temperament: json['temperament'] as String,
      weight: json['weight']['imperial'] as String,
      country: json['origin'] as String,
      countryCode: json['country_code'] as String);

  @override
  List<Object?> get props => [id, name, origin, description];
}


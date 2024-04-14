import 'package:dio/dio.dart';

class CatApi {
  static final get = CatApi._();
  
  CatApi._();
  var dio = Dio();

  Map<String, dynamic> headers = {
    "Content-Type": "application/json",
    "x-api-key": "bda53789-d59e-46cd-9bc4-2936630fde39"
  };

  Future<Response> getApiInfo() async{
    final response = await dio.get('https://api.thecatapi.com/v1/breeds',
                                  options: Options(headers: headers));
    return response;
  }

  Future<Response> getRandomCatImage() async{
    final response = await dio.get('https://api.thecatapi.com/v1/images/search');
    return response;
  }

  Future<Response> getRandomCatImageByBreedId(String breedId) async{
    final response = await dio.get('https://api.thecatapi.com/v1/images/search?limit=10&breed_ids=$breedId');
    return response;
  }
}
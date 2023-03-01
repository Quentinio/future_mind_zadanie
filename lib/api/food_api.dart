import 'package:http/http.dart';

import '../blocks/models/food_model.dart';


class FoodApi {
  Future<List<FoodModel>> getPosts() async {
    String endpoint = 'https://recruitment-task.futuremind.dev/recruitment-task';
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      return foodModelFromJson(response.body);
    } else {
      throw Exception('Ups..something went wrong, try again later.');
    }
  }
}
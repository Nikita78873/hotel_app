import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hotel_app/model/hotel_model.dart';

class HotelApi {
  Future<Hotel> fetchData () async {
    var uri = Uri.parse('https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473');

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      return Hotel.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
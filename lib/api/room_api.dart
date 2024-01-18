import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hotel_app/model/room_model.dart';

class RoomApi {
  Future<RoomModel> fetchData () async {
    var uri = Uri.parse('https://run.mocky.io/v3/85db21b4-32a7-4032-bb80-694bb596a445');

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      return RoomModel.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}

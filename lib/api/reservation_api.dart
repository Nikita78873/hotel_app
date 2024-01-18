import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hotel_app/model/reservation_model.dart';

class ReservationApi {
  Future<Reservation> fetchData () async {
    var uri = Uri.parse('https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff');

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      return Reservation.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
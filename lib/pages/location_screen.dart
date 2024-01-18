import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hotel_app/api/hotel_api.dart';
import 'package:hotel_app/pages/hotel_page.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.black87, size: 100.0),
      ),
    );
  }

  void getData() async {
    try {
      var dataInfo = await HotelApi().fetchData();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HotelPage(dataInfo: dataInfo);
          },
        ),
      );
    } catch (e) {
      print('$e');
    }
  }
}

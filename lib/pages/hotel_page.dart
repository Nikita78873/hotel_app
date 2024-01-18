import 'package:flutter/material.dart';
import 'package:hotel_app/api/room_api.dart';
import 'package:hotel_app/pages/room_page.dart';
import 'package:hotel_app/widgets/advantages.dart';
import 'package:hotel_app/widgets/peculiarities.dart';
import 'package:hotel_app/widgets/rating.dart';
import 'package:hotel_app/widgets/slider.dart';

class HotelPage extends StatefulWidget {
  final dataInfo;

  const HotelPage({this.dataInfo});

  @override
  State<HotelPage> createState() => _HotelPageState(dataInfo: dataInfo);
}

class _HotelPageState extends State<HotelPage> {
  final dataInfo;
  _HotelPageState({this.dataInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Отель"),
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: sliderwidget(dataInfo.imageUrls),
            ),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
              ),
              child: ratingWidget(
                rating: dataInfo.rating,
                name: dataInfo.ratingName,
                context: context,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                top: 5,
              ),
              child: Text(
                dataInfo.name,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
              ),
              child: Text(
                dataInfo.adress,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 13, 114, 255),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                top: 10,
              ),
              child: Row(
                children: [
                  Text(
                    'От ${dataInfo.minimalPrice.toString()} ₽ ',
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    dataInfo.priceForIt,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 130, 135, 150),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                top: 20,
              ),
              child: const Text(
                'Об отеле',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.07,
                right: MediaQuery.of(context).size.width * 0.07,
                top: 10,
              ),
              child: ListView.builder(
                itemCount: dataInfo.aboutTheHotel.peculiarities.length,
                padding: const EdgeInsets.all(5),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return peculiaritiesWidget(
                    name: dataInfo.aboutTheHotel.peculiarities[index],
                    context: context,
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                top: 10,
              ),
              child: Text(
                dataInfo.aboutTheHotel.description,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.03,
                right: MediaQuery.of(context).size.width * 0.03,
                top: 10,
              ),
              child: advantagesTileWidget(
                iconwidget: const Icon(Icons.mood),
                subtitle: 'Самое необходимое',
                text: 'Удобство',
                context: context,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.03,
                right: MediaQuery.of(context).size.width * 0.03,
              ),
              child: advantagesTileWidget(
                iconwidget: const Icon(Icons.check_box),
                subtitle: 'Самое необходимое',
                text: 'Что включено',
                context: context,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.03,
                right: MediaQuery.of(context).size.width * 0.03,
              ),
              child: advantagesTileWidget(
                iconwidget: const Icon(Icons.close),
                subtitle: 'Самое необходимое',
                text: 'Что не включено',
                context: context,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.03,
                right: MediaQuery.of(context).size.width * 0.03,
                bottom: 20,
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 13, 114, 255),
                  ),
                ),
                onPressed: () {
                  getData(dataInfo.name);
                },
                child: const Text(
                  'К выбору номера',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getData(String hotelname) async {
    try {
      var dataInfo = await RoomApi().fetchData();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return RoomPage(dataInfo: dataInfo, hotelname: hotelname);
          },
        ),
      );
    } catch (e) {
      print('$e');
    }
  }
}

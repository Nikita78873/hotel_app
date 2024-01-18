import 'package:flutter/material.dart';
import 'package:hotel_app/api/reservation_api.dart';
import 'package:hotel_app/pages/reservation_page.dart';
import 'package:hotel_app/widgets/additional_room.dart';
import 'package:hotel_app/widgets/advantages.dart';
import 'package:hotel_app/widgets/peculiarities.dart';
import 'package:hotel_app/widgets/rating.dart';
import 'package:hotel_app/widgets/slider.dart';

class RoomPage extends StatefulWidget {
  final dataInfo;
  final hotelname;

  const RoomPage({this.dataInfo, this.hotelname});

  @override
  State<RoomPage> createState() =>
      _RoomPageState(dataInfo: dataInfo, hotelname: hotelname);
}

class _RoomPageState extends State<RoomPage> {
  final dataInfo;
  final hotelname;
  _RoomPageState({this.dataInfo, this.hotelname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(hotelname),
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height / 1.15,
          child: ListView.builder(
            itemCount: dataInfo.rooms.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    child: sliderwidget(dataInfo.rooms[index].imageUrls),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1,
                      right: MediaQuery.of(context).size.width * 0.1,
                    ),
                    child: Text(
                      dataInfo.rooms[index].name,
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: (dataInfo.rooms[index].peculiarities.length * 25)
                        .toDouble(),
                    child: ListView.builder(
                      itemCount: dataInfo.rooms[index].peculiarities.length,
                      itemBuilder: (context, index1) {
                        return Container(
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.1,
                            right: MediaQuery.of(context).size.width * 0.1,
                          ),
                          child: peculiaritiesWidget(
                            name: dataInfo.rooms[index].peculiarities[index1],
                            context: context,
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1,
                    ),
                    alignment: Alignment.topLeft,
                    child: addroominfo('Подробнее о номере'),
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
                          '${dataInfo.rooms[index].price.toString()} ₽ ',
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          dataInfo.rooms[index].pricePer,
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
                      left: MediaQuery.of(context).size.width * 0.03,
                      right: MediaQuery.of(context).size.width * 0.03,
                      top: 10,
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
                        getData();
                      },
                      child: const Text(
                        'К выбору номера',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Divider(height: 2),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void getData() async {
    try {
      var dataInfo = await ReservationApi().fetchData();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return ReservationPage(dataInfo: dataInfo);
          },
        ),
      );
    } catch (e) {
      print('$e');
    }
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hotel_app/api/hotel_api.dart';
import 'package:hotel_app/pages/hotel_page.dart';

class PaidPage extends StatefulWidget {
  const PaidPage({super.key});

  @override
  State<PaidPage> createState() => _PaidPageState();
}

class _PaidPageState extends State<PaidPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text("Заказ оплачен"),
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/picture.png"),
                ),
              ),
            ),
          ),
          Container(
            child: Text(
              "Ваш заказ принят в работу",
              style: TextStyle(fontSize: 22),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width / 1.2,
            child: Text(
              'Подтверждение заказа #${Random().nextInt(100000)} может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(
                top: 30,
                bottom: 30,
              ),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  //CustomerInformation().submitForm(context: context);
                  getData();
                },
                child: Text(
                  'Супер!',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 13, 114, 255),
                  ),
                ),
              ),
            ),
          ),
        ],
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

import 'package:flutter/material.dart';
import 'package:hotel_app/api/reservation_api.dart';
import 'package:hotel_app/model/user.dart';
import 'package:hotel_app/pages/paid_page.dart';
import 'package:hotel_app/widgets/additional_room.dart';
import 'package:hotel_app/widgets/advantages.dart';
import 'package:hotel_app/widgets/customer_info.dart';
import 'package:hotel_app/widgets/peculiarities.dart';
import 'package:hotel_app/widgets/rating.dart';
import 'package:hotel_app/widgets/slider.dart';

class ReservationPage extends StatefulWidget {
  final dataInfo;

  const ReservationPage({this.dataInfo});

  @override
  State<ReservationPage> createState() =>
      _ReservationPageState(dataInfo: dataInfo);
}

class _ReservationPageState extends State<ReservationPage> {
  final dataInfo;
  _ReservationPageState({this.dataInfo});

  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text("Бронирование"),
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.45,
                top: 30,
              ),
              child: ratingWidget(
                name: dataInfo.ratingName,
                rating: dataInfo.horating,
                context: context,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                top: 10,
              ),
              child: Text(
                dataInfo.hotelName,
                style: TextStyle(fontSize: 22),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
              ),
              child: Text(
                dataInfo.hotelAdress,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 13, 114, 255),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.085,
                right: MediaQuery.of(context).size.width * 0.085,
                top: 30,
              ),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(0.6),
                  1: FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Вылет из",
                          style: TextStyle(
                            color: Color.fromARGB(255, 130, 135, 150),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(dataInfo.departure),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Страна, город",
                          style: TextStyle(
                            color: Color.fromARGB(255, 130, 135, 150),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(dataInfo.arrivalCountry),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Даты",
                          style: TextStyle(
                            color: Color.fromARGB(255, 130, 135, 150),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(dataInfo.tourDateStart +
                            ' – ' +
                            dataInfo.tourDateStop),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Кол-во ночей",
                          style: TextStyle(
                            color: Color.fromARGB(255, 130, 135, 150),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                            Text(dataInfo.numberOfNights.toString() + ' ночей'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Отель",
                          style: TextStyle(
                            color: Color.fromARGB(255, 130, 135, 150),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(dataInfo.hotelName),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Номер",
                          style: TextStyle(
                            color: Color.fromARGB(255, 130, 135, 150),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(dataInfo.room),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Питание",
                          style: TextStyle(
                            color: Color.fromARGB(255, 130, 135, 150),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(dataInfo.nutrition),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 30,
              ),
              width: MediaQuery.of(context).size.width / 1.4,
              height: MediaQuery.of(context).size.height / 3,
              child: CustomerInformation(),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 3500, minHeight: 56.0),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: counter,
                itemBuilder: (context, index) {
                  final _nameController = TextEditingController();
                  final _surnameController = TextEditingController();
                  final _bornController = TextEditingController();
                  final _citizenshipController = TextEditingController();
                  final _validityController = TextEditingController();
                  final _numberController = TextEditingController();
                  User newUser = User();

                  @override
                  void dispose() {
                    _nameController.dispose();
                    _surnameController.dispose();
                    _bornController.dispose();
                    _citizenshipController.dispose();
                    _validityController.dispose();
                    _numberController.dispose();
                    super.dispose();
                  }

                  return Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              '${index + 1}-й турист',
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(fontSize: 22, color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          margin: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Имя',
                              labelStyle: TextStyle(color: Colors.grey),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                            ),
                            onSaved: (value) => newUser.name = value!,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          margin: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: _surnameController,
                            decoration: InputDecoration(
                              labelText: 'Фамилия',
                              labelStyle: TextStyle(color: Colors.grey),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                            ),
                            onSaved: (value) => newUser.surname = value!,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          margin: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: _bornController,
                            decoration: InputDecoration(
                              labelText: 'Дата рождения',
                              labelStyle: TextStyle(color: Colors.grey),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                            ),
                            onSaved: (value) => newUser.born = value!,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          margin: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: _citizenshipController,
                            decoration: InputDecoration(
                              labelText: 'Гражданство',
                              labelStyle: TextStyle(color: Colors.grey),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                            ),
                            onSaved: (value) => newUser.citizenship = value!,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          margin: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: _numberController,
                            decoration: InputDecoration(
                              labelText: 'Номер загранпаспорта',
                              labelStyle: TextStyle(color: Colors.grey),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                            ),
                            onSaved: (value) => newUser.number = value!,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          margin: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: _validityController,
                            decoration: InputDecoration(
                              labelText: 'Срок действия загранпаспорта',
                              labelStyle: TextStyle(color: Colors.grey),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                            ),
                            onSaved: (value) => newUser.validity = value!,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width / 1.2,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                child: Text(
                  'Добавить туриста',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.085,
                right: MediaQuery.of(context).size.width * 0.085,
                top: 30,
              ),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Тур",
                          style: TextStyle(
                            color: Color.fromARGB(255, 130, 135, 150),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(dataInfo.tourPrice.toString() + ' ₽'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Топливный сбор",
                          style: TextStyle(
                            color: Color.fromARGB(255, 130, 135, 150),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(dataInfo.fuelCharge.toString() + ' ₽'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Сервисный сбор",
                          style: TextStyle(
                            color: Color.fromARGB(255, 130, 135, 150),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(dataInfo.serviceCharge.toString() + ' ₽'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "К оплате",
                          style: TextStyle(
                            color: Color.fromARGB(255, 130, 135, 150),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          (dataInfo.tourPrice +
                                      dataInfo.fuelCharge +
                                      dataInfo.serviceCharge)
                                  .toString() +
                              ' ₽',
                          style: TextStyle(
                            color: Color.fromARGB(255, 13, 114, 255),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 30,
                bottom: 30,
              ),
              width: MediaQuery.of(context).size.width / 1.2,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  //CustomerInformation().submitForm(context: context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaidPage(),
                      ));
                },
                child: Text(
                  'Оплатить ' +
                      ' ${dataInfo.tourPrice + dataInfo.fuelCharge + dataInfo.serviceCharge} ₽',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 13, 114, 255),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

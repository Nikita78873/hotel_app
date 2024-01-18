import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class CustomerInformation extends StatelessWidget {
  CustomerInformation({super.key});

  @override
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "Информация о покупателе",
              style: TextStyle(fontSize: 22),
            ),
          ),
          TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(
              labelText: 'Номер телефона',
              labelStyle: TextStyle(color: Colors.grey),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.grey, width: 2.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.grey, width: 2.0),
              ),
            ),
            keyboardType: TextInputType.phone,
            validator: (value) => _validatePhoneNumber(value!)
                ? null
                : 'Phone number must be entered as (###)###-####',
            inputFormatters: [
              MaskedInputFormatter('+7 (###) ###-##-##'),
            ],
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Почта',
              labelStyle: TextStyle(color: Colors.grey),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.grey, width: 2.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.grey, width: 2.0),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: _validateEmail,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "Эти данные никому не передаются. После оплаты мы вышлим чек на указанные вами номер и почту.",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null) {
      return 'Email cannot be empty';
    } else if (!_emailController.text.contains('@')) {
      return 'Invalid email address';
    } else {
      return null;
    }
  }

  bool _validatePhoneNumber(String input) {
    final _phoneExp = RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\d\d$');
    return _phoneExp.hasMatch(input);
  }

  void submitForm({required BuildContext context}) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      log('Phone: ${_phoneController.text}');
      log('Email: ${_emailController.text}');
    } else {
      _showMessage(
          message: 'Form is not valid! Please review and correct',
          context: context);
    }
  }

  void _showMessage({required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.red,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

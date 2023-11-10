import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyDetails extends StatefulWidget {
  const CurrencyDetails({super.key});

  @override
  State<CurrencyDetails> createState() => _CurrencyDetailsState();
}

class _CurrencyDetailsState extends State<CurrencyDetails> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return const Scaffold(
        body: Center(
          child: Text(
            "Coin Details page goes here...",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
      );
  }
}

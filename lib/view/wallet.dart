
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Wallets",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: width * 0.53,
                ),
                const Icon(
                  Icons.notifications_none_sharp,
                  size: 25,
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                const Icon(Icons.settings_sharp)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

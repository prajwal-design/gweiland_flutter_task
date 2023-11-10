import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gweiland_flutter_task/providers/currency_provider.dart';
import 'package:gweiland_flutter_task/providers/logo_provider.dart';
import 'package:gweiland_flutter_task/view/home.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(GweilandFlutter());
}

class GweilandFlutter extends StatefulWidget{
  const GweilandFlutter({super.key});

  @override
  State<GweilandFlutter> createState() => _GweilandFlutterState();
}

class _GweilandFlutterState extends State<GweilandFlutter> {

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: "Gweiland Flutter Task",
     home: MultiProvider(
         providers: [
           ChangeNotifierProvider<CurrencyProvider>( create: (context) => CurrencyProvider()),
           ChangeNotifierProvider<LogoProvider>( create: (context) => LogoProvider()),
         ],
         child: const HomeScreen()
     ),
   );
  }
}
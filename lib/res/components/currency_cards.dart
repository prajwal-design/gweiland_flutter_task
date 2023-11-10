import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gweiland_flutter_task/utils/colors.dart';

class CurrencyCard extends StatelessWidget {
  String logo;
  String coinName;
  String tickerSymbol;
  String price;
  String percentage;

   CurrencyCard(
      { super.key,
        required this.logo,
        required this.coinName,
        required this.percentage,
        required this.price,
        required this.tickerSymbol});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
        height: width*0.4,
        width: width*0.9,
        margin: EdgeInsets.only(top: width*0.02),
        child: Card(
            color: Colors.greenAccent[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 3, // Adjust elevation as needed
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                  child: chart()
              ),
               Positioned(
                left: 25,
                  top: 20,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: CustomColors.lineCharBellowColor,
                    child: Image.asset(logo,color: Colors.white,width: 45,),
                  )
              ),
              Positioned(
                left: 95,
                  top: 25,
                  child: SizedBox(
                    height: width*0.15,
                    child: Column(
                    children: [
                      Text(tickerSymbol,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                      const SizedBox(height: 3,),
                       Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(coinName,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                      )
                    ],
                  ),)
              ),
               Positioned(
                right: 25,
                  top: 27,
                  child: Text("\$$price USD",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w800),)),
               Positioned(
                  right: 22,
                  top: 51,
                  child: Text("$percentage %",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.green[800]),)),
            ],
          )
        ));
  }
  // This is only for demo purpous once we get actual data.dart we can update it dynamically
  Widget chart(){
    return ClipRRect(
      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
      child: SizedBox(
        height: 70,
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: false),
            titlesData: const FlTitlesData(show: false),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots:const [
                   FlSpot(0.1, 60),
                  FlSpot(0.2, 50),
                  FlSpot(0.3, 54),
                  FlSpot(0.4, 52),
                  FlSpot(0.5, 53),
                  FlSpot(0.6, 45),
                  FlSpot(0.7, 55),
                  FlSpot(0.8, 50),
                  FlSpot(0.9, 55),
                  FlSpot(0.95, 45),
                  FlSpot(1, 60),

                ],
                isCurved: true,
                color: Colors.green,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  color: CustomColors.lineCharBellowColor // #00CE08
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gweiland_flutter_task/models/currency.dart';
import 'package:gweiland_flutter_task/providers/currency_provider.dart';
import 'package:provider/provider.dart';

import '../../providers/logo_provider.dart';
import '../../view/currency_details.dart';

class CurrencyListItem extends StatefulWidget {
  final Currency? currency;
  final int? index;

  const CurrencyListItem(
      {super.key, required this.currency, required this.index});

  @override
  State<CurrencyListItem> createState() => _CurrencyListItemState();
}

class _CurrencyListItemState extends State<CurrencyListItem> {
  LogoProvider? logoProvider;

  @override
  void initState() {
    logoProvider = Provider.of<LogoProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    logoProvider?.getCoinData(widget.currency!.data![widget.index!].id);
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CurrencyDetails(),));
          },
          contentPadding: EdgeInsets.zero,
          leading: circleAvatar(widget.index!),
          title: Text(
            widget.currency!.data![widget.index!].symbol!,
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            widget.currency!.data![widget.index!].name!,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          trailing: Container(
            padding: EdgeInsets.only(right: width * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${widget.currency!.data![widget.index!].quote!.uSD!.price.toString().split('.')[0]}',
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${widget.currency!.data![widget.index!].quote!.uSD!.marketCapDominance.toString().split('.')[0]}%',
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
        Positioned(
            top: width * 0.06, left: width * 0.45, child: lineChart(width))
      ],
    );
  }

  Widget circleAvatar(int index) {
    // trigger api here..
    return Consumer<CurrencyProvider>(builder: (context, snap, child) {
      return snap.isLoading ||
              snap.isLoading == false && snap.isNoData ||
              snap.isLoading == false && snap.isError
          ? CircleAvatar(
              radius: 26,
              backgroundColor: Colors.grey[400],
            )
          : CircleAvatar(
              radius: 26,
              child: snap.logoUrl!.length >index ?
              Image.network(
                snap.logoUrl![index] ,
                width: 45,
                fit: BoxFit.cover,
              ): SizedBox(),
            );
    });
  }

  Widget lineChart(width) {
    return SizedBox(
      width: width * 0.2,
      height: width * 0.04,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: const [
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
              color: (widget.currency?.data?[widget.index!].quote?.uSD
                          ?.percentChange24h <
                      0)
                  ? Colors.red
                  : Colors.green,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

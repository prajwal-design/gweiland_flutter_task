import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/currency_provider.dart';
import '../res/components/currency_cards.dart';
import '../res/components/currency_list_item.dart';
import '../utils/colors.dart';

enum _menuValues { price, volume_24h, marketcap }

class Exchange extends StatefulWidget {
  const Exchange({super.key});

  @override
  State<Exchange> createState() => _ExchangeState();
}

class _ExchangeState extends State<Exchange> {
  CurrencyProvider? currencyProvider;

  @override
  void initState() {
    currencyProvider = Provider.of<CurrencyProvider>(context, listen: false);
    currencyProvider!.getCoinData("market_cap");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "EXCHANGES",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: width * 0.4,
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
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: width * 0.05,
                    ),
                    child: SizedBox(
                      width: width * 0.65,
                      height: width * 0.12,
                      child: SearchBar(
                        leading: Container(
                            padding: const EdgeInsets.only(left: 7),
                            child: const Icon(
                              Icons.search,
                              size: 25,
                              color: CustomColors.searchIconColor,
                            )),
                        hintText: "Search Cryptocurrency",
                        hintStyle: MaterialStateProperty.all(const TextStyle(
                            color: CustomColors.searchIconColor,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                        backgroundColor: MaterialStateProperty.all(
                            CustomColors.searchBarBackGroundColor),
                        elevation: MaterialStateProperty.all(0),
                        onTap: () {},
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  popUpButton(width)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    "Cryptocurrency",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Text(
                    "NFT",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: CustomColors.searchIconColor),
                  )
                ],
              ),
              CurrencyCard(
                logo: 'assets/bit coin.png',
                coinName: 'Bitcoin',
                percentage: '+12',
                price: '55,000',
                tickerSymbol: 'BTC',
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    "Top Cryptocurrency",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: width * 0.22,
                  ),
                  const Text(
                    "View All",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: CustomColors.searchIconColor),
                  ),
                ],
              ),
              currencyList(width)
            ],
          ),
        ),
      ),
    );
  }

  Widget currencyList(double width) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: width * 0.82,
      child: MediaQuery.removePadding(
        context: context,
        removeLeft: true,
        child: Consumer<CurrencyProvider>(builder: (context, snap, child) {
          return ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 20,
            itemBuilder: (context, index) {
              return snap.isLoading
                  ? const Center(child: Text(""))
                  : snap.isLoading == false && snap.isNoData
                      ? Center(child: Text("No Data Found"))
                      : snap.isLoading == false && snap.isError
                          ? Center(child: Text("Something went wrong"))
                          : CurrencyListItem(
                              currency: snap.data,
                              index: index,
                            );
            },
          );
        }),
      ),
    );
  }

  Widget popUpButton(width) {
    return Padding(
      padding: EdgeInsets.only(top: width * 0.06, left: width * 0.03),
      child: PopupMenuButton<_menuValues>(
        itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem(child: Text("Sort By :")),
            const PopupMenuItem(value: _menuValues.price, child: Text("Price")),
            const PopupMenuItem(
                value: _menuValues.volume_24h, child: Text("Volume 24h")),
            const PopupMenuItem(
                value: _menuValues.marketcap, child: Text("Market Cap")),
          ];
        },
        onSelected: (items) {
          switch (items) {
            case _menuValues.price:
              currencyProvider!.getCoinData("price");
              break;
            case _menuValues.volume_24h:
              currencyProvider!.getCoinData("volume_24h");
              break;
            case _menuValues.marketcap:
              currencyProvider!.getCoinData("market_cap");
              break;
            default:
              currencyProvider!.getCoinData("market_cap");
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: CustomColors.filterBorderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          height: width * 0.11,
          width: 83,
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.filter_list_sharp,
                  color: CustomColors.searchIconColor,
                ),
                Text("Filter",
                    style: TextStyle(
                      color: CustomColors.searchIconColor,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

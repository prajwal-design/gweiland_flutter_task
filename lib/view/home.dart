import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gweiland_flutter_task/utils/colors.dart';
import 'package:gweiland_flutter_task/view/wallet.dart';
import 'package:provider/provider.dart';

import '../providers/logo_provider.dart';
import 'e_shope.dart';
import 'exchange.dart';
import 'launchpads.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {

  LogoProvider? logoProvider;
  int _selectedIndex = 1;

  @override
  void initState() {
    logoProvider = Provider.of<LogoProvider>(context, listen: false);

    debugPrint("Triggering api.. in init state..");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body:
        _selectedIndex==0? const Eshop() : _selectedIndex == 1? const Exchange():_selectedIndex==2? const LaunchPads():_selectedIndex==3?const Wallet():const SizedBox(),
        bottomNavigationBar: bottomNavBar(width));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget bottomNavBar(double width) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: BottomAppBar(
          color: Colors.transparent, // Make it transparent
          elevation: 0, // Remove elevation
          shape: const CircularNotchedRectangle(), // Add a curved shape
          child: Container(
              height: width * 0.23, // Adjust the height as needed
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(38),
                    bottom: Radius.circular(38)), // Add curved edges
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 1, left: 10),
                        child: IconButton(
                          icon: Icon(
                            Icons.tag_faces,
                            color: _selectedIndex==0?CustomColors.isActiveColor:CustomColors.searchIconColor,
                            size: 28,
                          ),
                          onPressed: () => _onItemTapped(0),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.only(bottom: 1, left: 10),
                        child: Text(
                          "€-shop",
                          style: TextStyle(color:  _selectedIndex==0?CustomColors.isActiveColor:CustomColors.searchIconColor),
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 1, left: 10),
                        child: IconButton(
                          icon: Icon(Icons.compare_arrows,
                              color: _selectedIndex==1?CustomColors.isActiveColor:CustomColors.searchIconColor),
                          onPressed: () => _onItemTapped(1),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.only(bottom: 1, left: 10),
                        child: Text(
                          "Exchange",
                          style: TextStyle(color: _selectedIndex==1?CustomColors.isActiveColor:CustomColors.searchIconColor),
                        ),
                      )
                    ],
                  ),
                  const CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.transparent,
                    child: Image(
                      image: AssetImage('assets/globe.png'),
                      fit: BoxFit.fill,
                    ), // Image radius
                  ),
                  // const SizedBox(width: 64),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 1, left: 5),
                        child: IconButton(
                          icon: Icon(Icons.rocket_launch_outlined,
                              color: _selectedIndex==2?CustomColors.isActiveColor:CustomColors.searchIconColor),
                          onPressed: () => _onItemTapped(2),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.only(bottom: 1, left: 5),
                        child: Text(
                          "Launchpads",
                          style: TextStyle(color: _selectedIndex==2?CustomColors.isActiveColor:CustomColors.searchIconColor),
                        ),
                      )
                    ],
                  ), // This is for the curved part
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 1, left: 5, right: 10),
                        child: IconButton(
                          icon:  Icon(Icons.wallet_travel_outlined,
                              color: _selectedIndex==3?CustomColors.isActiveColor:CustomColors.searchIconColor),
                          onPressed: () => _onItemTapped(3),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 1, left: 5, right: 10),
                        child: Text(
                          "Wallet",
                          style: TextStyle(color: _selectedIndex==3?CustomColors.isActiveColor:CustomColors.searchIconColor),
                        ),
                      )
                    ],
                  ),
                ],
              ))),
    );
  }

}

import 'package:xBet.app/Widgets/allGamesWidgets.dart';
import 'package:xBet.app/Widgets/firstPageWidgets.dart';
import 'package:xBet.app/constants/constantsColor.dart';
import 'package:xBet.app/models/categoryModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AllGamesScreen extends StatefulWidget {
  double profit;
  AllGamesScreen(this.profit, {super.key});
  @override
  State<AllGamesScreen> createState() => _AllGamesScreenState();
}

class _AllGamesScreenState extends State<AllGamesScreen> {
  // int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: ConstantsColor.textColor,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "1xGames",
          style: TextStyle(
              color: ConstantsColor.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  FirstPageWidgets.depositList(context, widget.profit),
                  FirstPageWidgets.depositeBtn(context),
                ],
              ),
            ),
            Container(
              height: 10,
              color: Colors.white,
            ),
            Container(color: ConstantsColor.bgAccountPage, height: 10),
            AllGamesWidgets.horizontalList(context),
            Container(height: 10, color: ConstantsColor.bgAccountPage),
            AllGamesWidgets.gridView(context, widget.profit)
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBarItem(),
    );
  }

  static BottomNavigationBar bottomNavigationBarItem() {
    int selectedIndex = 0;
    return BottomNavigationBar(
      // showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle:
          TextStyle(fontSize: 12, color: ConstantsColor.linkAccountDeposite),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image(
            image: AssetImage("assets/esport.png"),
            height: 40,
          ),
          label: 'All Games',
        ),
        BottomNavigationBarItem(
          icon: Image(
            image: AssetImage("assets/20.png"),
            height: 40,
          ),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Image(height: 40, image: AssetImage("assets/21.png")),
          label: 'CashBack',
        ),
        BottomNavigationBarItem(
          icon: Image(height: 30, image: AssetImage("assets/favourite.png")),
          label: 'Favourites',
        ),
      ],
      currentIndex: selectedIndex,
      showUnselectedLabels: true,
      // fixedColor: ConstantsColor.textColor,
      selectedItemColor: ConstantsColor.textColor,
      unselectedItemColor: ConstantsColor.textColor,

      onTap: (val) {
        setState() {
          selectedIndex = val;
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

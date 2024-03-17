import 'package:provider/provider.dart';
import 'package:xBet.app/constants/constantsColor.dart';
import 'package:xBet.app/models/categoryModel.dart';
import 'package:xBet.app/models/itemsModel.dart';
import 'package:xBet.app/provider/gameProvider.dart';
import 'package:xBet.app/screens/gamePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllGamesWidgets {
  static List<CategoryModel> gameList = [
    CategoryModel(imageURL: "assets/img.jpg", categoryName: "Crash"),
    CategoryModel(
        imageURL: "assets/apple.jpg", categoryName: "Apple Of Fortune"),
    CategoryModel(imageURL: "assets/gems.jpg", categoryName: "Gems & Mines"),
    CategoryModel(imageURL: "assets/lucky.jpg", categoryName: "Lucky Wheel"),
    CategoryModel(
        imageURL: "assets/vampire.jpg", categoryName: "Vampire Curse"),
    CategoryModel(imageURL: "assets/img.jpg", categoryName: "Crash"),
  ];
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  // static void _onItemTapped(int value) {}

  static Widget gameContainer(String imageURL, String title, IconData icon,
      BuildContext context, double profit) {
    return Consumer<GameProvider>(
      builder: (context, value, child) {
        return Material(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          elevation: 0,
          child: InkWell(
            onTap: () {
              if (title == "Apple Of Fortune") {
                value.changeProfitValue(profit);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (b) => GamePage(profit)));
              }
            },
            child: Column(
              children: [
                SizedBox(
                  height: 2,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image(
                      fit: BoxFit.fitWidth,
                      height: 100,
                      // width: 200,
                      image: AssetImage(imageURL)),
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 14,
                              color: ConstantsColor.linkAccountDeposite,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 1.0),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(icon, color: Colors.blue)),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget gridView(BuildContext context, double profit) {
    return Container(
      color: ConstantsColor.bgAccountPage,
      height: MediaQuery.of(context).size.height - 260,
      child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
          crossAxisCount: 2,
          children: List.generate(
              gameList.length,
              (index) => gameContainer(
                  gameList[index].imageURL,
                  gameList[index].categoryName,
                  Icons.star_border,
                  context,
                  profit))),
    );
  }

  static List<String> filterList = [
    "filter",
    "All",
    "For you",
    "Best",
    "New",
    "Local"
  ];
  static Widget horizontalList(BuildContext context) {
    return Container(
      color: ConstantsColor.bgAccountPage,
      height: 35,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: filterList.length,
          padding: EdgeInsets.only(left: 4.0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (c, index) {
            return GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Material(
                  elevation: 1.5,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 60,
                    width: 55,
                    decoration: BoxDecoration(
                        color: (index == 1) ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (index == 0)
                            ? Icon(
                                Icons.filter_list_outlined,
                                color: ConstantsColor.textColor,
                              )
                            : Container(
                                width: 0,
                              ),
                        Text(
                          filterList[index],
                          style: TextStyle(
                              fontSize: 12,
                              color:
                                  (index == 1) ? Colors.white : Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

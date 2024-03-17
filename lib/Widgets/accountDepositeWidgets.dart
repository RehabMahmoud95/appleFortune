import 'package:xBet.app/constants/constantsColor.dart';
import 'package:xBet.app/models/categoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountDepositeWidgets {
  static List<CategoryModel> bankCard = [
    CategoryModel(imageURL: "assets/visa.jpg", categoryName: "Visa"),
    CategoryModel(imageURL: "assets/master.jpg", categoryName: "MasterCard"),
  ];
  static List<CategoryModel> recommendedList = [
    CategoryModel(imageURL: "assets/v.jpg", categoryName: "Vodafoune"),
    CategoryModel(
        imageURL: "assets/etisalat.jpg", categoryName: "Etisalat Cash"),
    CategoryModel(imageURL: "assets/instapay.jpg", categoryName: "InstaPay"),
    CategoryModel(imageURL: "assets/orange.jpg", categoryName: "Orange Cash"),
    CategoryModel(imageURL: "assets/we.jpg", categoryName: "We Pay Egypt"),
    CategoryModel(imageURL: "assets/smart.jpg", categoryName: "Smart Wallet"),
    CategoryModel(imageURL: "assets/bm.jpg", categoryName: "BM Wallet"),
    CategoryModel(
        imageURL: "assets/perfect.jpg", categoryName: "Perfect Money"),
    CategoryModel(imageURL: "assets/telda.jpg", categoryName: "Telda"),
  ];
  static Widget gridView(BuildContext context, String type) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 260,
      child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          crossAxisCount: 3,
          children: List.generate(
              (type == "bank") ? bankCard.length : recommendedList.length,
              (index) => Container(
                    height: 100,
                    width: 200,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Center(
                          child: Image(
                              height: 70,
                              width: 70,
                              fit: BoxFit.contain,
                              image: AssetImage((type == "bank")
                                  ? bankCard[index].imageURL
                                  : recommendedList[index].imageURL)),
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 10,
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 150,
                          color: ConstantsColor.containerAccountPage,
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                (type == "bank")
                                    ? bankCard[index].categoryName
                                    : recommendedList[index].categoryName,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))),
    );
  }
}

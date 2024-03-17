import 'package:xBet.app/constants/constantsColor.dart';
import 'package:xBet.app/models/categoryModel.dart';
import 'package:xBet.app/models/itemsModel.dart';
import 'package:xBet.app/screens/accountDeposite.dart';
import 'package:xBet.app/screens/allGamesScreen.dart';
import 'package:flutter/material.dart';

class FirstPageWidgets {
  static List<ItemsModel> items = [
    new ItemsModel(
        imageURL: "assets/live.png",
        title: "Live",
        subTitle: "bet on live events"),
    new ItemsModel(
        imageURL: "assets/s.png",
        title: "Sports",
        subTitle: "bet on unComming events"),
    new ItemsModel(
        imageURL: "assets/esport.png",
        title: "Esports",
        subTitle: "bet on esports events"),
    new ItemsModel(
        imageURL: "assets/slots.png",
        title: "Slots",
        subTitle: "bet on Slot events"),
    new ItemsModel(
        imageURL: "assets/liveC.png",
        title: "Live casino",
        subTitle: "Feel like you're in a casino"),
    new ItemsModel(
        imageURL: "assets/1x.png", title: "1xGames", subTitle: "Play and Win"),
    new ItemsModel(
        imageURL: "assets/cart.png",
        title: "Promo Codes",
        subTitle: "Promo points: 0 PTS"),
    new ItemsModel(
        imageURL: "assets/customer.png",
        title: "Customer Support",
        subTitle: "Contact us and we'll help you"),
  ];
  static AppBar firstAppbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Image(
                height: 25,
                width: 25,
                image: AssetImage("assets/message.png"))),
        IconButton(
            onPressed: () {},
            icon: Image(
              height: 30,
              width: 30,
              image: AssetImage("assets/setting.png"),
            )),
        SizedBox(
          width: 10,
        )
      ],
      title: Row(
        // mainAxisAlignment: MainAxisAlignment.,
        children: [
          CircleAvatar(
            radius: 20.5, backgroundImage: AssetImage('assets/1.png'),
            backgroundColor: Colors.transparent,
            // child: Icon(
            //   Icons.person,
            //   color: Colors.grey,
            // ),
          ),
          SizedBox(
            width: 5,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "Hosam Elking\n",
                style: TextStyle(
                    color: ConstantsColor.linkAccountDeposite,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: "Personal Profile",
                style: TextStyle(
                    color: Colors.blue[700],
                    // fontWeight: FontWeight.bold,
                    fontSize: 14)),
          ]))
          // Text("My name\n"),
          // Text(
          //   "personal Profile",
          //   style: TextStyle(color: Colors.grey),
          // )
        ],
      ),
    );
  }

  static Widget depositList(BuildContext context, double profit) {
    List<String> depositNumber = ["$profit ج.م"];
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Container(
        height: 45,
        // padding: EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
            color: ConstantsColor.bgAccountPage,
            borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.of(context).size.width - 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image(
                height: 30,
                width: 30,
                fit: BoxFit.contain,
                image: AssetImage(
                  "assets/deposite.png",
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            DropdownButton(
                itemHeight: 50,
                // alignment: Alignment.topLeft,
                borderRadius: BorderRadius.circular(10),
                dropdownColor:
                    Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
                // Initial Value
                value: depositNumber[0],
                // isExpanded: true,
                underline: Container(),
                icon: Container(),
                // Down Arrow Icon
                // icon:

                // Array list of items
                items: depositNumber.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(
                      items,
                      style:
                          TextStyle(color: ConstantsColor.linkAccountDeposite),
                    ),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {}),
          ],
        ),
      ),
    );
  }

  static Widget depositeBtn(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (b) => new AccountDeposite()));
      },
      child: Container(
        height: 40,
        width: 110,
        decoration: BoxDecoration(
            color: Colors.green[400], borderRadius: BorderRadius.circular(8)),
        child: const Center(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                "Deposite",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static List<CategoryModel> categoryList = [
    CategoryModel(imageURL: "assets/top.png", categoryName: "Top"),
    CategoryModel(imageURL: "assets/sport.png", categoryName: "Sports"),
    CategoryModel(imageURL: "assets/casino.png", categoryName: "Casino"),
    CategoryModel(imageURL: "assets/1x.png", categoryName: "1xGames"),
    CategoryModel(imageURL: "assets/other.png", categoryName: "Other"),
  ];
  static Widget categorysWidget(CategoryModel categoryModel) {
    return Container(
      color: Colors.white,
      height: 60,
      width: 70,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: GestureDetector(
          onTap: () {
            // setState(() {
            //   currentIndex = index;
            // });
          },
          child: Column(
            children: [
              Flexible(
                child: Image(
                    fit: BoxFit.contain,
                    height: 40,
                    width: 40,
                    image: AssetImage(categoryModel.imageURL)),
              ),
              Text(
                categoryModel.categoryName,
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
    // SizedBox(
    //   height: 100,
    //   child: ListView.builder(
    //       scrollDirection: Axis.horizontal,
    //       itemCount: categoryList.length,
    //       itemBuilder: (c, index) {
    //         return Padding(
    //           padding: const EdgeInsets.only(left: 15.0, right: 15.0),
    //           child: AnimatedContainer(
    //             duration: Duration(milliseconds: 300),
    //             child: Column(
    //               children: [
    //                 Image(image: AssetImage(categoryList[index].imageURL)),
    //                 Text(categoryList[index].categoryName)
    //               ],
    //             ),
    //           ),
    //         );
    //       }),
    // );
  }

  static Widget itemContainer(
      ItemsModel item, BuildContext context, double profit) {
    return SizedBox(
      height: 70,
      child: InkWell(
        onTap: () {
          if (item.title == "1xGames") {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (b) => AllGamesScreen(profit)));
          }
        },
        child: Card(
          color: (item.title == "Promo Codes")
              ? Color.fromARGB(255, 59, 176, 231)
              : Colors.white,
          elevation: 0,
          child: Row(
            children: [
              CircleAvatar(
                radius: 25.0, backgroundImage: AssetImage(item.imageURL),
                backgroundColor: Colors.transparent,
                // child: Icon(
                //   Icons.person,
                //   color: Colors.grey,
                // ),
              ),
              const SizedBox(
                width: 15,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "${item.title}\n",
                    style: const TextStyle(color: Colors.black, fontSize: 17)),
                TextSpan(
                    text: item.subTitle,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 94, 93, 93), fontSize: 15)),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}

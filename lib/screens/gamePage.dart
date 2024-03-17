// import "package:xBet.app/Widgets/gameWidgets.dart";
import "package:xBet.app/constants/constantsColor.dart";
import "package:xBet.app/constants/constantUI.dart";
import "package:xBet.app/constants/constantsImages.dart";
import "package:xBet.app/provider/gameProvider.dart";
// import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
// import "package:fluttertoast/fluttertoast.dart";
import "package:provider/provider.dart";
import "package:xBet.app/screens/allGamesScreen.dart";
// import "package:flutter/widgets.dart";

class GamePage extends StatefulWidget {
  final double profit;
  GamePage(this.profit);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
      controller.text = widget.profit.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, value, child) {
     
      return PopScope(
        onPopInvoked: (v) { print("back btn");
          // if (!value.isPlaying) {
            //  print("is done ::::::::::::::: ${value.isDone}");
            // Navigator.of(context).push(MaterialPageRoute(builder: (b) => AllGamesScreen(widget.profit)));
          // }
          
          // else{
           value.resetValues();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (c) => GamePage(widget.profit))); 
          // }
         
        },
        child: Scaffold(
          //
          appBar: ConstantsUI.myAppBar(
              (!value.isDone) ? widget.profit : value.totalProfit),
          body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/bg.jpg"), fit: BoxFit.fill)),
              child: Column(
                children: [
                  // myProfit(totalProfit!),
                  // SizedBox(height: 10,),
                  Flexible(
                      flex: 7,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: 60,
                              child: ListView.builder(
                                  padding: EdgeInsets.only(
                                      top: 20.0,
                                      left: 10,
                                      bottom: (value.isPlaying &&
                                              value.currentRow == 0)
                                          ? 210
                                          : 25),
                                  itemCount: value.listOfProfit.length,
                                  reverse: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20.0, bottom: 5),
                                      child: Container(
                                          height: 30,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              color: (index == value.currentRow)
                                                  ? Colors.green
                                                  : Colors.black
                                                      .withOpacity(0.3),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                            child: Text(
                                                (value.currentRow > 0 &&
                                                        index <
                                                            value.listOfProfit
                                                                    .length -
                                                                2)
                                                    ? "x ${value.listOfProfit[++index]}"
                                                    : (index ==
                                                                value.listOfProfit
                                                                        .length -
                                                                    2 &&
                                                            value.currentRow >
                                                                0)
                                                        ? "x 11.18"
                                                        : (index ==
                                                                    value.listOfProfit
                                                                            .length -
                                                                        1 &&
                                                                value.currentRow >
                                                                    1)
                                                            ? "x 349.68"
                                                            : "x ${value.listOfProfit[index++]}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 9)),
                                          )),
                                    );
                                  }),
                            ),
                          ),
                          Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 45.0),
                                child: GridView.count(
                                    primary: false,
                                    padding: const EdgeInsets.all(5),
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 2,
                                    crossAxisCount: 5,
                                    children: List.generate(
                                      growable: false,
                                      value.gameList.length,
                                      (index) {
                                        return InkWell(
                                          onTap: (!value.isPlaying)
                                              ? null
                                              : !((index >= value.arrowIndex1 &&
                                                      index <
                                                          value.arrowIndex2))
                                                  ? null
                                                  : () {
                                                      if (value.isLost) {
                                                        // Fluttertoast.showToast(
                                                        //     msg: "خسرت .. حاول مرة اخرى",
                                                        //     backgroundColor: Colors.black,
                                                        //     fontSize: 16,
                                                        //     gravity: ToastGravity.CENTER,
                                                        //     textColor: Colors.white);
                                                        ConstantsUI.showMyDialog(
                                                            context,
                                                            "Better Luck next time\n             try again");
                                                        value.changeDoneState();
                                                        value.incrementRow();
                                                        // setState(() {
                                                        //   value.isDone = true;
                                                        // });
                                                      } else {
                                                        if (value.currentRow <=
                                                            8) {
                                                          value.incrementRow();
                                                          value.changePlayState(
                                                              true);
                                                          // setState(() {
                                                          //   value.currentRow += 1;
                                                          //   value.isPlaying = true;
                                                          // });
                                                        }
                                                        value.changeValues(
                                                            index);
                                                        // print(
                                                        //     "increament profit value::::::::::::::::::: ${value.listOfProfit[value.currentRow]}");
                                                        value.increamentTotalProfit(
                                                            value.listOfProfit[
                                                                value
                                                                    .currentRow]);
                                                        print(
                                                            "current winning ::::::::::::::::" +
                                                                value
                                                                    .totalProfit
                                                                    .toString());
                                                      }
                                                    },
                                          child: Image.asset(
                                            (value.isDone && index % 2 != 0)
                                                ? ConstantsImages.badApple
                                                : (value.isDone &&
                                                        index % 2 == 0)
                                                    ? ConstantsImages.winApple
                                                    : (!value.gameList[index]
                                                                .isApple &&
                                                            value.isDone)
                                                        ? ConstantsImages
                                                            .badApple
                                                        : (value.gameList[index]
                                                                .isApple)
                                                            ? ConstantsImages
                                                                .winApple
                                                            : (index >=
                                                                        value
                                                                            .blankIndex1 &&
                                                                    index <
                                                                        value
                                                                            .blankIndex2)
                                                                ? ConstantsImages
                                                                    .blankImage
                                                                : (index >= value.arrowIndex1 &&
                                                                        index <
                                                                            value
                                                                                .arrowIndex2)
                                                                    ? ConstantsImages
                                                                        .arrowImage
                                                                    : ConstantsImages
                                                                        .emptyImage,
                                            fit: BoxFit.contain,
                                            height: 30,
                                            width: 30,
                                            opacity: AlwaysStoppedAnimation((value
                                                    .isDone)
                                                ? 0.9
                                                : (((index >=
                                                            value.arrowIndex1 &&
                                                        index <
                                                            value.arrowIndex2)))
                                                    ? 1.0
                                                    : (value.gameList[index]
                                                            .isApple)
                                                        ? 0.9
                                                        : .5),
                                          ),
                                        );
                                      },
                                    )),
                              ))
                        ],
                      )),
                  playingContainer(double.parse(
                      (value.totalProfit.toString().length <= 3)
                          ? value.totalProfit.toString().substring(0, 3)
                          : value.totalProfit.toString().substring(0, 4))),
                  (value.isPlaying && value.currentRow == 0)
                      ? SizedBox()
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            height: 40,
                            color: Colors.black.withOpacity(0.4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    Text(
                                      "SETTING",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 30,
                                  width: 2,
                                  color: Colors.grey,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.ads_click,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    Text(
                                      "IN ONE CLICK",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                ],
              )),
        ),
      );
    });
  }

  Widget playingContainer(double p) {
    // double p = ;

    // print(
    //     " current p ::::::::::::::::::::: $p, length :::::::::::::: ${p.toString().length}");
    return Consumer<GameProvider>(
      builder: (context, value, child) {
        return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: (value.isPlaying && value.currentRow == 0)
                  ? []
                  : (value.isDone && value.isPlaying)
                      ?

                      // bottomColumn("PLAY AGAIN? (10 ج م)", "CHANGE STAKE", () {
                      //     // setState(() {
                      //     value.resetValues();

                      //     // });
                      //   })
                      [
                          InkWell(
                            onTap: () {
                              value.newGame();
                              value.changeProfitValue(
                                  double.parse(controller.text));
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, top: 30),
                              child: Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width - 100,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "PLAY AGAIN? (10 ج م)",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              value.resetValues();
                              value.changeProfitValue(
                                  double.parse(controller.text));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width - 100,
                                decoration: BoxDecoration(
                                    color: ConstantsColor.blueButtom,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "CHANGE STAKE",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]
                      : (!value.isPlaying)
                          ? [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            color: ConstantsColor.blueButtom,
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        width: 70,
                                        height: 35,
                                        child: TextButton(
                                          onPressed: () {
                                            value.changeLostState();
                                            print(
                                                "lost value::::::::::::::::::::::::::: ${value.isLost}");
                                          },
                                          child: Text(
                                            "MIN",
                                            style: TextStyle(
                                                color:
                                                    ConstantsColor.whiteText),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: ConstantsColor.blueButtom,
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        width: 70,
                                        height: 35,
                                        child: TextButton(
                                          onPressed: () {
                                            value.changeLostState();
                                            print(
                                                "lost value::::::::::::::::::::::::::: ${value.isLost}");
                                          },
                                          child: Text(
                                            "X2",
                                            style: TextStyle(
                                                color:
                                                    ConstantsColor.whiteText),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: ConstantsColor.blueButtom,
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        width: 70,
                                        height: 35,
                                        child: TextButton(
                                          onPressed: () {
                                            value.changeLostState();
                                            print(
                                                "lost value::::::::::::::::::::::::::: ${value.isLost}");
                                          },
                                          child: Text(
                                            "X3",
                                            style: TextStyle(
                                                color:
                                                    ConstantsColor.whiteText),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: ConstantsColor.blueButtom,
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        width: 70,
                                        height: 35,
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            "MAX",
                                            style: TextStyle(
                                                color:
                                                    ConstantsColor.whiteText),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Consumer<GameProvider>(
                                  builder: (context, value, child) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 5),
                                  child: Container(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      decoration: BoxDecoration(
                                          color:
                                              ConstantsColor.containerGameColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      width: MediaQuery.of(context).size.width,
                                      height: 80,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 150,
                                                  height: 30,
                                                  child: TextField(
                                                    onEditingComplete: () {
                                                      print(
                                                          "new profit :::::::::::::::::::::::::::::::::: ${controller.text}");
                                                      value.changeProfitValue(
                                                          double.parse(
                                                              controller.text));
                                                    },
                                                    controller: controller,
                                                    decoration: InputDecoration(
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide
                                                                        .none)),
                                                    // "${totalProfit!.roundToDouble()} م ج ",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Container(
                                                  width: 150,
                                                  height: 2,
                                                  color: Colors.grey,
                                                ),
                                                Text(
                                                  "From 10 م ج to 71 310.1 ج م ",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color:
                                                    ConstantsColor.blueButtom,
                                              ),
                                              height: 40,
                                              // width: 70,
                                              child: TextButton(
                                                  onPressed: () {
                                                    value.changePlayState(true);
                                                    // setState(() {
                                                    //   value.isLost = true;
                                                    // });
                                                    // showMyDialog(context, totalProfit.toString());
                                                  },
                                                  child: Text(
                                                    "Start",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  )),
                                            ),
                                          ),
                                        ],
                                      )),
                                );
                              })
                            ]
                          : [
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 3, top: 30),
                                child: Container(
                                  height: 30,
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      "CURRENT WINNING: ${p} ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: InkWell(
                                  onTap: () {
                                    ConstantsUI.showMyDialog(
                                        context, p.toString());
                                    value.changeDoneState();
                                  },
                                  child: Container(
                                    height: 30,
                                    width:
                                        MediaQuery.of(context).size.width - 100,
                                    decoration: BoxDecoration(
                                        color: ConstantsColor.blueButtom,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        "TAKE WINNINGS",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
            ));
      },
    );
  }

  List<Widget> bottomColumn(String title1, String title2, Function myFunc) {
    return [
      Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 30),
        child: Container(
          height: 30,
          width: MediaQuery.of(context).size.width - 100,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              title1,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: InkWell(
          onTap: myFunc(),
          child: Container(
            height: 30,
            width: MediaQuery.of(context).size.width - 100,
            decoration: BoxDecoration(
                color: ConstantsColor.blueButtom,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                title2,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    ];
  }
}

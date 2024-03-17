import 'package:provider/provider.dart';
import 'package:xBet.app/constants/constantsImages.dart';
import 'package:xBet.app/models/gameModel.dart';
import 'package:xBet.app/provider/gameProvider.dart';
import 'package:xBet.app/services/from_hexa.dart';
import 'package:flutter/material.dart';

class ConstantsUI {
  static Color? mainColor = HexColor.fromHex("#284563");
  static Color? gamePageColor = HexColor.fromHex("#498cd2");
  static Color? gamePageColorOpacity =
      HexColor.fromHex("#498cd2").withOpacity(0.5);
  static LinearGradient gradientColor() {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        HexColor.fromHex("#633812"),
        HexColor.fromHex("#633e1d"),
        HexColor.fromHex("#634d39"),
        HexColor.fromHex("#63503f"),
        HexColor.fromHex("#61574e"),
      ],
    );
  }

  static AppBar myAppBar(double profit) {
    // String subString = profit.toString().substring(
    //     profit.toString().indexOf("."), profit.toString().indexOf(".") + 2);
    // // print("i ${profit.toString().indexOf(".")}");
    // print(
    //     "my profit : $profit , sub string :::::::::::::::::::::::::::::::: $subString");
    double p = double.parse((profit.toString().length <= 3)
        ? profit.toString().substring(0, 3)
        : profit.toString().substring(0, 4));
    print("profit :::>>>>>>>>>>>>>>>>>>>>>>>>> $p");
    return AppBar(
        actions: [
          SizedBox(
            width: 15,
          ),
          Image(
              height: 30,
              width: 30,
              fit: BoxFit.contain,
              image: AssetImage(ConstantsImages.gameIcon1)),
          SizedBox(
            width: 15,
          ),
          Image(
              height: 30,
              width: 30,
              fit: BoxFit.contain,
              image: AssetImage(ConstantsImages.gameIcon2)),
          SizedBox(
            width: 15,
          ),
        ],
        // leading: IconButton(icon: Icon(Icons),),
        elevation: 0.5,
        // backgroundColor: Colors.black.withOpacity(0.9),
        centerTitle: true,
        flexibleSpace: Image(
          image: AssetImage('assets/bg.jpg'),
          fit: BoxFit.cover,
          opacity: AlwaysStoppedAnimation(0.6),
        ),
        backgroundColor: Colors.black,
        title: Column(
          children: [
            Container(
              height: 25,
              width: 85,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(25)),
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Consumer<GameProvider>(
                          builder: (context, value, child) {
                      
                       return Text(
                          "${p} ج.م",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        );
                      }),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.green),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Apple For Fortune",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }

  static Container secondContainer(String text) {
    return Container(
      width: 80,
      height: 35,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 126, 164, 231),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static Widget myProfit(int currenProfit) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                // color: gamePageColor,
                // shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/wallet.png"),
                    fit: BoxFit.contain)),
            // child: IconButton(
            //   icon: Icon(
            //     Icons.messenger_outlined,
            //     color: Colors.white,
            //   ),
            //   onPressed: null,
            // ),
          ),
          Flexible(child: SizedBox(width: 10.0)),
          Text(
            "ج.م" + currenProfit.toString(),
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

// int AppleIndex = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];
// Widget gameGridView() {
//   // return GridView.count(
//   //     primary: false,
//   //     padding: const EdgeInsets.all(20),
//   //     crossAxisSpacing: 2,
//   //     mainAxisSpacing: 2,
//   //     crossAxisCount: 5,
//   //     children: List.generate(
//   //       40,
//   //       (index) {
//   //         return InkWell(
//   //           onTap: () {

//   //           },
//   //           child: Image.asset(
//   //             (index >= blankIndex1 && index < blankIndex2)
//   //                 ? blankImage
//   //                 : (index >= arrowIndex)
//   //                     ? arrowImage
//   //                     : emptyImage,
//   //             fit: BoxFit.contain,
//   //             height: 30,
//   //             width: 30,
//   //           ),
//   //         );
//   //       },
//   //     )

//   //     );
// }

  static Future<void> showMyDialog(
      BuildContext context, String totalProfit) async {
    return showDialog<void>(
      context: context,

      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black.withOpacity(0.2),
          title: Center(
              child: Text(
            (totalProfit.contains("try")) ? "" : 'WIN',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          )),
          content: SingleChildScrollView(
              child: Center(
            child: Text(
              (totalProfit.contains("try"))
                  ? totalProfit
                  : "YOU WON: ${totalProfit.toString()} ج.م",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          )),
          // actions: <Widget>[
          //   TextButton(
          //     child: const Center(
          //         child: Text('حسنا',
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 17,
          //                 fontWeight: FontWeight.bold))),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ],
        );
      },
    );
  }
}

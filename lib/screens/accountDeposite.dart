import 'package:xBet.app/Widgets/accountDepositeWidgets.dart';
import 'package:xBet.app/Widgets/allGamesWidgets.dart';
import 'package:xBet.app/constants/constantsColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountDeposite extends StatefulWidget {
  const AccountDeposite({super.key});

  @override
  State<AccountDeposite> createState() => _AccountDepositeState();
}

class _AccountDepositeState extends State<AccountDeposite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Account Deposits",
          style: TextStyle(
              fontSize: 15,
              color: ConstantsColor.textColor,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.replay_outlined,
              color: ConstantsColor.textColor,
            )),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
              // textDirection: TextDirection.ltr,
              "Account 2156349870236",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 120, left: 10),
            child: Container(
              height: 30,

              // width: MediaQuery.of(context).size.width / 1.5,
              decoration:
                  BoxDecoration(color: ConstantsColor.containerAccountPage),
              child: Center(
                child: Text(
                  "Types of payment systems",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              children: [
                Container(
                  color: Colors.white,
                  height: 20,
                  width: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 10,
                      width: 10,
                      color: Colors.green,
                    ),
                  ),
                ),
                Text("Payment systems in your region"),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Container(
              color: Colors.grey[350],
              // height: 250,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.assignment_late_rounded,
                        size: 50,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            style: TextStyle(color: Colors.black),
                            text:
                                "عزيزي المستخدم اذا قمت بعمليه ايداع ولم تصلك الاموال على حسابك الشخصى خلال 3 ساعات . الرجاء التواصل على خدمة دعم العملاء عبر البريد الالكترونى ليتم العمل ع حل مشكلتك ",
                          ),
                          TextSpan(
                              text: "processing@eg.1xpet-team.com",
                              style: TextStyle(
                                  color: ConstantsColor.linkAccountDeposite))
                        ])),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Flexible(
            child: Container(
              // height: MediaQuery.of(context).size.height / 2 - 250,
              color: ConstantsColor.bgAccountPage,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "RECOMMENDED METHODS",
                      style: TextStyle(
                          color: ConstantsColor.textColor, fontSize: 14),
                    ),
                  ),
                  AccountDepositeWidgets.gridView(context, "recommended")
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Flexible(
            child: Container(
              // height: MediaQuery.of(context).size.height / 3 - 100,
              color: ConstantsColor.bgAccountPage,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Bank Card",
                      style: TextStyle(
                          color: ConstantsColor.textColor, fontSize: 14),
                    ),
                  ),
                  AccountDepositeWidgets.gridView(context, "bank")
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

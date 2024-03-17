import 'package:xBet.app/constants/constantUI.dart';
import 'package:xBet.app/screens/gamePage.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta_meta.dart';

class SecondPage extends StatefulWidget {
  final int price;
  SecondPage(this.price);
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController controller = TextEditingController();
  double currentProfit = 1.00;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstantsUI.myAppBar(currentProfit),
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg2.jpeg"), fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstantsUI.myProfit(widget.price),
                  Flexible(child: SizedBox(height: 100.0)),
                  Text(
                    "جرب حظك! تذوق تفاح الثلج الابيض!",
                    style: TextStyle(color: Colors.white54, fontSize: 18),
                  ),
                  SizedBox(height: 10.0),
                  Image(
                    image: AssetImage("assets/img.png"),
                    height: 100,
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                  Flexible(
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height / 3 - 70)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: ConstantsUI.secondContainer("أقصى")),
                      Flexible(child: ConstantsUI.secondContainer("x/2")),
                      Flexible(child: ConstantsUI.secondContainer("x2")),
                      Flexible(child: ConstantsUI.secondContainer("أدنى")),
                    ],
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'من فضلك ادخل مبلغ الرهان';
                      }
                      return null;
                    },
                    textDirection: TextDirection.rtl,
                    controller: controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        hintText: "ادخال مبلغ الرهان",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  // Divider(color: mainColor,),

                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "> 0.2",
                        style: TextStyle(color: Colors.white54),
                      ),
                      Text(
                        "< 799.8",
                        style: TextStyle(color: Colors.white54),
                      )
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: ConstantsUI.mainColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              double p = (double.tryParse(controller.text))!;
                              currentProfit = widget.price - p;
                            });

                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (c) => GamePage(currentProfit)));
                          }
                        },
                        child: const Text(
                          "وضع الرهان",
                          style: TextStyle(color: Colors.white54),
                        )),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

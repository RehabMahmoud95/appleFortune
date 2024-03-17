import 'package:xBet.app/constants/constantUI.dart';
import 'package:xBet.app/screens/firstPage.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  TextEditingController controller = TextEditingController(text: "1.00");
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConstantsUI.myAppBar(
          double.parse(controller.text.toString())),
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg.jpg"), fit: BoxFit.fill)),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'من فضلك ادخل المبلغ';
                      }
                      return null;
                    },
                    textDirection: TextDirection.rtl,
                    controller: controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.white),
                        // prefixIconColor: Colors.grey,
                        hintTextDirection: TextDirection.rtl,
                        hintText: "اكتب المبلغ",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: ConstantsUI.gamePageColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (c) => FirstPage(
                                      double.tryParse(controller.text) ?? 1.00,
                                    )));
                          }
                        },
                        child: Text(
                          "دخول",
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

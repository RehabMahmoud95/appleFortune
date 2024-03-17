import 'package:xBet.app/Widgets/bottomNavBar.dart';
import 'package:xBet.app/constants/constantsColor.dart';
import 'package:xBet.app/provider/gameProvider.dart';
import 'package:xBet.app/screens/accountDeposite.dart';
import 'package:xBet.app/screens/allGamesScreen.dart';
import 'package:xBet.app/screens/firstPage.dart';
import 'package:xBet.app/screens/gamePage.dart';
import 'package:xBet.app/screens/mainPage.dart';
import 'package:xBet.app/screens/startPage.dart';
import 'package:xBet.app/services/from_hexa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Apple For Fortune',
          theme: ThemeData(
            primaryColor: ConstantsColor.bgAccountPage,
            // appBarTheme: AppBarTheme(
            //   backgroundColor: HexColor.fromHex("#567294"),
            // ),
            colorScheme:
                ColorScheme.fromSeed(seedColor: HexColor.fromHex("#567294")),
            useMaterial3: true,
          ),
          home: StartPage()),
    );
  }
}

import 'package:xBet.app/Widgets/bottomNavBar.dart';
import 'package:xBet.app/constants/constantsColor.dart';
import 'package:xBet.app/screens/firstPage.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PersistentTabController _controller = PersistentTabController();

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: BottomNavBar.buildScreens(),
          items: BottomNavBar.navBarsItems(),
          // resizeToAvoidBottomInset: true,
          navBarHeight: 70,
          bottomScreenMargin: 0,
          // onWillPop: (final context) async {
          //   await showDialog(
          //     context: context,
          //     useSafeArea: true,
          //     builder: (final context) => Container(
          //       height: 50,
          //       width: 50,
          //       color: Colors.white,
          //       child: ElevatedButton(
          //         child: const Text("Close"),
          //         onPressed: () {
          //           Navigator.pop(context);
          //         },
          //       ),
          //     ),
          //   );
          //   return false;
          // },
          // selectedTabScreenContext: (final context) {
          //   testContext = context;
          // },

          backgroundColor: Colors.white,
          // hideNavigationBar: _hideNavBar,
          decoration: const NavBarDecoration(colorBehindNavBar: Colors.white),
          // itemAnimationProperties: const ItemAnimationProperties(
          //   duration: Duration(milliseconds: 400),
          //   curve: Curves.ease,
          // ),
          // screenTransitionAnimation: const ScreenTransitionAnimation(
          //   animateTabTransition: true,
          // ),
          navBarStyle: NavBarStyle.style15,
        ),
      );
}

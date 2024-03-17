import 'package:xBet.app/models/categoryModel.dart';
import 'package:xBet.app/screens/firstPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter/material.dart';

class BottomNavBar {
  static List<Widget> buildScreens() {
    return [
      FirstPage(1),
      FirstPage(1),
      FirstPage(1),
      FirstPage(1),
      FirstPage(1)
    ];
  }

  static List<CategoryModel> items = [
    CategoryModel(imageURL: "assets/popular.png", categoryName: "Popular"),
    CategoryModel(imageURL: "assets/favourite.png", categoryName: "Favourites"),
    CategoryModel(imageURL: "assets/bitSlip.png", categoryName: "Bet Slip"),
    CategoryModel(imageURL: "assets/history.png", categoryName: "History"),
    CategoryModel(imageURL: "assets/menu.png", categoryName: "Menu"),
  ];
  static List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image(image: AssetImage(items[0].imageURL)),
        title: (items[0].categoryName),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Image(image: AssetImage(items[1].imageURL)),
        title: (items[1].categoryName),
        // activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Image(image: AssetImage(items[2].imageURL)),
        title: (items[2].categoryName),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Image(image: AssetImage(items[3].imageURL)),
        title: (items[3].categoryName),
        activeColorPrimary: Colors.white,

        // activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Image(image: AssetImage(items[4].imageURL)),
        title: (items[4].categoryName),
        activeColorPrimary: Colors.white,

        // activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  static PersistentTabView persistentTabView(
      BuildContext context, PersistentTabController controller) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: buildScreens(),
      items: navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}

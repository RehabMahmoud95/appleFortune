import 'package:xBet.app/Widgets/firstPageWidgets.dart';
import 'package:xBet.app/constants/constantsColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class FirstPage extends StatefulWidget {
  double profit;
  FirstPage(this.profit, {super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  ScrollController? controller;
  @override
  void initState() {
    super.initState();
    print("profit: ${widget.profit}");
    controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller!.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    print(controller!.position.extentAfter);
    if (controller!.position.extentAfter < 500) {
      setState(() {
        FirstPageWidgets.categoryList
            .addAll(List.generate(FirstPageWidgets.items.length, (index) {
          return FirstPageWidgets.categoryList[index];
        }));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantsColor.bgAccountPage,
      appBar: FirstPageWidgets.firstAppbar(),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            color: Colors.white,
            height: 15,
          ),
          Container(
            color: Colors.white,
            // height: 100,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                FirstPageWidgets.depositList(context, widget.profit),
                FirstPageWidgets.depositeBtn(context)
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: 15,
          ),
          Container(
            color: Colors.white,
            height: 75,
            width: MediaQuery.of(context).size.width,
            child: Scrollbar(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: FirstPageWidgets.categoryList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (c, index) {
                    return FirstPageWidgets.categorysWidget(
                        FirstPageWidgets.categoryList[index]);
                  }),
            ),
          ),
          // Container(
          //   color: Colors.white,

          //   height: 5,),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 300,
              child: ListView.builder(
                  itemCount: FirstPageWidgets.items.length,
                  itemBuilder: (c, index) {
                    return FirstPageWidgets.itemContainer(
                        FirstPageWidgets.items[index], context, widget.profit);
                  }),
            ),
          )
        ],
      ),
    );
  }
}

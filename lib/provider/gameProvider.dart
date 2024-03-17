import 'package:xBet.app/models/gameModel.dart';
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  // int i = 0;
  bool isPlaying = false;
  double totalProfit = 1.00;
  int currentRow = 0;
  bool isLost = false;
  bool isDone = false;
  List<double> listOfProfit = [
    1.54, //1.93
    1.93, //2.41
    2.41, //4.02
    4.02, //6.71
    6.71, //11.18
    11.18, //27.92
    27.97, //11.18
    69.93, //349.68
  ];
  int blankIndex1 = 0;
  int blankIndex2 = 20;
  int arrowIndex1 = 35;
  int arrowIndex2 = 40;
  bool isApple = false;

  List<GameModel> gameList = [
    GameModel(0, false),
    GameModel(1, false),
    GameModel(2, false),
    GameModel(3, false),
    GameModel(4, false),
    GameModel(5, false),
    GameModel(6, false),
    GameModel(7, false),
    GameModel(8, false),
    GameModel(9, false),
    GameModel(10, false),
    GameModel(11, false),
    GameModel(12, false),
    GameModel(13, false),
    GameModel(14, false),
    GameModel(15, false),
    GameModel(16, false),
    GameModel(17, false),
    GameModel(18, false),
    GameModel(19, false),
    GameModel(20, false),
    GameModel(21, false),
    GameModel(22, false),
    GameModel(23, false),
    GameModel(24, false),
    GameModel(25, false),
    GameModel(26, false),
    GameModel(27, false),
    GameModel(28, false),
    GameModel(29, false),
    GameModel(30, false),
    GameModel(31, false),
    GameModel(32, false),
    GameModel(33, false),
    GameModel(34, false),
    GameModel(35, false),
    GameModel(36, false),
    GameModel(37, false),
    GameModel(38, false),
    GameModel(39, false),
  ];

  changeValues(int index) {
    blankIndex2 -= 5;
    arrowIndex1 -= 5;
    arrowIndex2 -= 5;
    gameList[index].isApple = true;
    notifyListeners();
  }

  resetValues() {
    isDone = false;
    isLost = false;
    isPlaying = false;

    currentRow = 0;
    blankIndex1 = 0;
    blankIndex2 = 20;
    arrowIndex1 = 35;
    arrowIndex2 = 40;
    isApple = false;
    for (int i = 0; i < gameList.length; i++) {
      gameList[i].isApple = false;
    }
    notifyListeners();
  }

  newGame() {
    isDone = false;
    isLost = false;
    currentRow = 0;
    blankIndex1 = 0;
    blankIndex2 = 20;
    arrowIndex1 = 35;
    arrowIndex2 = 40;
    isApple = false;
    for (int i = 0; i < gameList.length; i++) {
      gameList[i].isApple = false;
    }
    notifyListeners();
  }

  changeDoneState() {
    isDone = true;
    notifyListeners();
  }

  changePlayState(bool playing) {
    isPlaying = playing;
    notifyListeners();
  }

  changeLostState() {
    isLost = true;
    notifyListeners();
  }

  incrementRow() {
    currentRow++;
    notifyListeners(); 
  }

  increamentTotalProfit(double myProfit) {
    print(
        "old profit : $totalProfit , new profit: $myProfit , result : ${totalProfit * myProfit}");
    totalProfit = totalProfit * myProfit;
    notifyListeners();
  }

  getTotalProfit() {
    return totalProfit;
    // notifyListeners();
  }

  changeProfitValue(double profit) {
    totalProfit = profit;
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxiapp/theme/colors.dart';

BottomNavigationBar bottomNavigationBar({
  required int currentIndex,
  required context,
  required Function(int) onTap,
}) {
  return BottomNavigationBar(
    iconSize: 28,
    selectedLabelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    unselectedFontSize: 15,
    type: BottomNavigationBarType.fixed,
    backgroundColor: Theme.of(context).customColor.mainBackgroundColor,
    onTap: onTap,
    currentIndex: currentIndex,
    selectedItemColor: Theme.of(context).customColor.thirdTextColor,
    unselectedItemColor: Theme.of(context).customColor.fourthTextColor,
    items: [
      BottomNavigationBarItem(
        icon: ImageIcon(
          const AssetImage("assets/icons/home_icon.png"),
          color: (currentIndex == 0)
              ? Theme.of(context).customColor.thirdTextColor
              : Theme.of(context).customColor.fourthTextColor,
        ),
        label: "Главная",
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(
          const AssetImage("assets/icons/Plagiarism Checker.png"),
          color: (currentIndex == 1)
              ? Theme.of(context).customColor.thirdTextColor
              : Theme.of(context).customColor.fourthTextColor,
        ),
        label: "Мои заказы",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.ellipses_bubble,
          color: (currentIndex == 2)
              ? Theme.of(context).customColor.thirdTextColor
              : Theme.of(context).customColor.fourthTextColor,
        ),
        label: "Поддержка",
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(
          const AssetImage("assets/icons/Setting.png"),
          color: (currentIndex == 3)
              ? Theme.of(context).customColor.thirdTextColor
              : Theme.of(context).customColor.fourthTextColor,
        ),
        label: "Настройки",
      ),
    ],
  );
}

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BottomNavigationBar bottomNavigationBar({
  required int currentIndex,
  required Function(int) onTap,
}) {
  return BottomNavigationBar(
    iconSize: 28,
    selectedLabelStyle: TextStyle(fontSize: 15),
    unselectedFontSize: 15,
    type: BottomNavigationBarType.fixed,
    backgroundColor: const Color(0xff1E2127),
    onTap: onTap,
    currentIndex: currentIndex,
    selectedItemColor: Colors.yellow,
    unselectedItemColor: Colors.white,
    items: [
      BottomNavigationBarItem(
        icon: ImageIcon(
          const AssetImage("assets/icons/home_icon.png"),
          color: (currentIndex == 0) ? Colors.yellow : Colors.white,
        ),
        label: "Главная",
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(
          const AssetImage("assets/icons/Plagiarism Checker.png"),
          color: (currentIndex == 1) ? Colors.yellow : Colors.white,
        ),
        label: "Мои заказы",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.ellipses_bubble,
          color: (currentIndex == 2) ? Colors.yellow : Colors.white,
        ),
        label: "Поддержка",
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(
          const AssetImage("assets/icons/Setting.png"),
          color: (currentIndex == 3) ? Colors.yellow : Colors.white,
        ),
        label: "Настройки",
      ),
    ],
  );
}

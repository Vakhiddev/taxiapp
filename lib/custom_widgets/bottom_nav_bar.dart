import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

BottomNavigationBar bottomNavigationBar({
  required int currentIndex,
  required Function(int) onTap,
}) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: const Color(0xff1E2127),
    onTap: onTap,
    currentIndex: currentIndex,
    selectedItemColor: Colors.yellow,
    unselectedItemColor: Colors.grey,
    items: [
      BottomNavigationBarItem(
        icon: ImageIcon(
          const AssetImage("assets/icons/home_icon.png"),
          color: (currentIndex == 0) ? Colors.yellow : Colors.grey,
        ),
        label: "Главная",
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(
          const AssetImage("assets/icons/Plagiarism Checker.png"),
          color: (currentIndex == 1) ? Colors.yellow : Colors.grey,
        ),
        label: "Заметки",
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.ellipses_bubble,
        ),
        label: "поддержка",
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(
          const AssetImage("assets/icons/Setting.png"),
          color: (currentIndex == 3) ? Colors.yellow : Colors.grey,
        ),
        label: "настройки",
      ),
    ],
  );
}

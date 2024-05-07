import 'package:flutter/material.dart';

BottomNavigationBar bottomNavigationBar({
  required int currentIndex,
  required Function(int) onTap,
}) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Color(0xff1E2127),
    onTap: onTap,
    currentIndex: currentIndex,
    selectedItemColor: Colors.yellow,
    unselectedItemColor: Colors.grey,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Главная"),
      BottomNavigationBarItem(
          icon: Icon(Icons.note_add_outlined), label: "Заметки"),
      BottomNavigationBarItem(
          icon: Icon(Icons.message_outlined), label: "поддержка"),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: "настройки"),
    ],
  );
}

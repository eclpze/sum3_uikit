import 'package:flutter/material.dart';
import 'package:sum3_uikit/colors.dart';
import 'package:sum3_uikit/styles.dart';

// Губайдуллина Камилла, 21.01.2026 13:30, навигация в приложении
class CustomTabBar extends StatelessWidget {
  final List<String> image; // Иконки
  final List<String> title; // Заголовки
  final int selectedValue; // Выбранное значение
  final ValueChanged onPressed; // Действие при нажатии
  final Color color; // Цвет тапбара

  const CustomTabBar({
    super.key,
    required this.image,
    required this.title,
    required this.selectedValue,
    required this.onPressed, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: color,
      currentIndex: selectedValue,
      onTap: onPressed,
      unselectedItemColor: icons,
      selectedItemColor: accent,
      unselectedLabelStyle: caption2Regular,
      selectedLabelStyle: caption2Regular,
      type: BottomNavigationBarType.fixed,
      items: List.generate(
        title.length,
            (index) => BottomNavigationBarItem(
          label: title[index],
          icon: Image.asset(
            image[index],
            width: 32,
            height: 32,
            color: selectedValue == index ? accent : icons,
          ),
        ),
      ),
    );
  }
}
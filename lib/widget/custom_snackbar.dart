import 'package:flutter/material.dart';
import 'package:sum3_uikit/styles.dart';

// Губайдуллина Камилла, 22.01.2026 20:24, окно для показа ошибки
class CustomSnackBar {
  static void show({
    required BuildContext context, // Контекст для показа окна
    required String title, // Заголовок окна
    required String text, // Контент окна
    required Color colorSnackBar, // Цвет окна
    required double radius, // Закругление окна
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: colorSnackBar,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          title: Text(title, style: title2Semibold),
          content: Text(text, style: title2Semibold),
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:sum3_uikit/styles.dart';
import 'package:sum3_uikit/sum3_uikit.dart';

// Губайдуллина Камилла, 22.01.2026 20:24, окно для показа ошибки
class CustomSnackBar {
  static void show({
    required BuildContext context, // Контекст
    required String title, // Заголовок
    required String text, // Контент в окне
    required Color colorSnackBar, // Цвет окна
    required double radius, // Закругление окна
    required String pathIcon, // Путь к иконке
    int seconds = 5, // Переменная для автоматического закрытия окна
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        if (seconds > 0) {
          Future.delayed(Duration(seconds: seconds), () {
            Navigator.of(dialogContext).pop();
          });
        }

        return AlertDialog(
          backgroundColor: colorSnackBar,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(title, style: title2Semibold),
                  Spacer(),
                  CustomIcon(
                    onIcon: () {
                      Navigator.of(dialogContext).pop();
                    },
                    widthIcon: 20,
                    heightIcon: 20,
                    pathIcon: pathIcon,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(text, style: title2Semibold),
            ],
          ),
        );
      },
    );
  }
}

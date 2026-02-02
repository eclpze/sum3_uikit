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
          contentPadding: EdgeInsets.all(20),
          content: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: title2Semibold),
                    const SizedBox(height: 8),
                    Text(text, style: title2Semibold),
                  ],
                ),
              ),
              Positioned(
                top: -30,
                right: -30,
                child: CustomBubble(
                  borderRadius: 20,
                  colorBubble: input_bg,
                  onBubble: () {
                    Navigator.of(dialogContext).pop();
                  },
                  widthBubble: 25,
                  heightBubble: 25,
                  pathBubble: pathIcon,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

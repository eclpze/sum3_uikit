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
      builder: (_) {
        if (seconds > 0) {
          Future.delayed(Duration(seconds: seconds), () {
            Navigator.of(context).pop();
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
                top: -12,
                right: -12,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: CustomIcon(
                      onIcon: () {
                        Navigator.of(context).pop();
                      },
                      widthIcon: 20,
                      heightIcon: 20,
                      pathIcon: pathIcon,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

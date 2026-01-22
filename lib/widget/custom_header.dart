import 'package:flutter/material.dart';
import 'package:sum3_uikit/styles.dart';
import 'package:sum3_uikit/widget/custom_bubble.dart';
import 'package:sum3_uikit/widget/custom_icon.dart';

// Губайдуллина Камилла, 22.01.2026 17:59, хэдер c двумя состояниями
enum HeaderType { small, big }

class CustomHeader extends StatelessWidget {
  final HeaderType type; // Тип хэдера
  final String title; // Заголовок
  final VoidCallback onBubble; // Действие при нажатии на иконку
  final double widthBubble; // Ширина иконки
  final double heightBubble; // Высота иконки
  final String pathBubble; // Путь к иконке
  final double borderRadius; // Закругление фона
  final Color colorBubble; // Цвет фона
  final VoidCallback onIcon; // Действие при нажатии на иконку
  final double widthIcon; // Ширина иконки
  final double heightIcon; // Высота иконки
  final String pathIcon; // Путь к иконке
  final double padding; // Внешние отступы

  const CustomHeader({
    super.key,
    required this.type,
    required this.title,
    required this.onBubble,
    required this.widthBubble,
    required this.heightBubble,
    required this.pathBubble,
    required this.borderRadius,
    required this.colorBubble,
    required this.onIcon,
    required this.widthIcon,
    required this.heightIcon,
    required this.pathIcon,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    if (type == HeaderType.small) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Row(
          children: [
            CustomBubble(
              borderRadius: borderRadius,
              colorBubble: colorBubble,
              onBubble: onBubble,
              widthBubble: widthBubble,
              heightBubble: heightBubble,
              pathBubble: pathBubble,
            ),
            Spacer(),
            Text(title, style: title2Semibold),
            Spacer(),
            CustomIcon(
              onIcon: onIcon,
              widthIcon: widthIcon,
              heightIcon: heightIcon,
              pathIcon: pathIcon,
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomBubble(
                  borderRadius: borderRadius,
                  colorBubble: colorBubble,
                  onBubble: onBubble,
                  widthBubble: widthBubble,
                  heightBubble: heightBubble,
                  pathBubble: pathBubble,
                ),
                Spacer(),
                CustomIcon(
                  onIcon: onIcon,
                  widthIcon: widthIcon,
                  heightIcon: heightIcon,
                  pathIcon: pathIcon,
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(title, style: title1ExtraBold),
          ],
        ),
      );
    }
  }
}

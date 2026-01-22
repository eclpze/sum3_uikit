import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Губайдуллина Камилла, 22.01.2026 17:52, иконка c фоном
class CustomBubble extends StatelessWidget {
  final VoidCallback onBubble; // Действие при нажатии на иконку
  final double widthBubble; // Ширина иконки
  final double heightBubble; // Высота иконки
  final String pathBubble; // Путь к иконке
  final double borderRadius; // Закругление фона
  final Color colorBubble; // Цвет фона

  const CustomBubble({
    super.key,
    required this.borderRadius,
    required this.colorBubble,
    required this.onBubble,
    required this.widthBubble,
    required this.heightBubble,
    required this.pathBubble,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthBubble + 10,
      height: heightBubble + 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        color: colorBubble,
      ),
      child: IconButton(
        onPressed: onBubble,
        icon: SvgPicture.asset(
          pathBubble,
          width: widthBubble,
          height: heightBubble,
        ),
      ),
    );
  }
}

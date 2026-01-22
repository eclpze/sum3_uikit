import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Губайдуллина Камилла, 21.01.2026 14:25, иконка для текста

class CustomIcon extends StatelessWidget {
  final VoidCallback onIcon; // Действие при нажатии на иконку
  final double widthIcon; // Ширина иконки
  final double heightIcon; // Высота иконки
  final String pathIcon; // Путь к иконке

  const CustomIcon({
    super.key,
    required this.onIcon,
    required this.widthIcon,
    required this.heightIcon,
    required this.pathIcon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onIcon,
      icon: SvgPicture.asset(pathIcon, width: widthIcon, height: heightIcon),
    );
  }
}

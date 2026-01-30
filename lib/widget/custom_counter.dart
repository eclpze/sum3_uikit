import 'package:flutter/material.dart';
import 'package:sum3_uikit/colors.dart';
import 'package:sum3_uikit/widget/custom_icon.dart';

// Губайдуллина Камилла, 22.01.2026 20:03, счетчик
class CustomCounter extends StatelessWidget {
  final Color color; // Цвет счетчика
  final double borderRadius; // Закругление
  final VoidCallback onPlus; // Действие при нажатии на иконку
  final double widthPlus; // Ширина иконки
  final double heightPlus; // Высота иконки
  final String pathPlus; // Путь к иконке
  final VoidCallback onMinus; // Действие при нажатии на иконку
  final double widthMinus; // Ширина иконки
  final double heightMinus; // Высота иконки
  final String pathMinus; // Путь к иконке
  final double height; //
  final double width; //

  const CustomCounter({
    super.key,
    required this.color,
    required this.borderRadius,
    required this.onPlus,
    required this.widthPlus,
    required this.heightPlus,
    required this.pathPlus,
    required this.onMinus,
    required this.widthMinus,
    required this.heightMinus,
    required this.pathMinus, required this.height, required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomIcon(
            onIcon: onMinus,
            widthIcon: widthMinus,
            heightIcon: heightMinus,
            pathIcon: pathMinus,
          ),
          Container(width: 2, height: 25, color: input_stroke),
          CustomIcon(
            onIcon: onPlus,
            widthIcon: widthPlus,
            heightIcon: heightPlus,
            pathIcon: pathPlus,
          ),
        ],
      ),
    );
  }
}

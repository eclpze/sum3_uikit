import 'package:flutter/material.dart';

// Губайдуллина Камилла, 22.01.2026 20:22, разделитель
class CustomDivider extends StatelessWidget {
  final Color colorDivider; // Цвет разделителя
  final double thicknessDivider; // Толщина разделителя
  final double paddingDivider; // Отступы
  final double heightDivider; // Высота разделителя

  const CustomDivider({
    super.key,
    required this.colorDivider,
    required this.thicknessDivider,
    required this.paddingDivider,
    required this.heightDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingDivider),
      child: Divider(
        color: colorDivider,
        thickness: thicknessDivider,
        height: heightDivider,
      ),
    );
  }
}

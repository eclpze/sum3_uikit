import 'package:flutter/material.dart';
import 'package:sum3_uikit/colors.dart';
import 'package:sum3_uikit/styles.dart';
import 'package:sum3_uikit/widget/custom_icon.dart';

// Губайдуллина Камилла, 21.01.2026 13:54, поиск в приложении
class CustomSearch extends StatefulWidget {
  final TextEditingController controller; // Контроллер для поиска
  final Color colorSearch; // Цвет поиска
  final Color colorCursor; // Цвет курсора
  final String hintText; // Заголовок
  final Color borderColor; // Цвет границ
  final double borderRadius; // Закругление
  final VoidCallback onPressed; // Действие при нажатии на иконку
  final double widthIcon; // Ширина иконки
  final double heightIcon; // Высота иконки
  final String pathIcon; // Путь к иконке
  final VoidCallback onPressed2; // Действие при нажатии на иконку
  final double widthIcon2; // Ширина иконки
  final double heightIcon2; // Высота иконки
  final String pathIcon2; // Путь к иконке
  final double padding; // Внешние отступы

  const CustomSearch({
    super.key,
    required this.controller,
    required this.colorSearch,
    required this.colorCursor,
    required this.hintText,
    required this.pathIcon,
    required this.pathIcon2,
    required this.borderColor,
    required this.borderRadius,
    required this.onPressed,
    required this.widthIcon,
    required this.heightIcon,
    required this.onPressed2,
    required this.widthIcon2,
    required this.heightIcon2,
    required this.padding,
  });

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.padding),
      child: TextField(
        controller: widget.controller,
        cursorColor: widget.colorCursor,
        onChanged: (value) {
          setState(() {});
        },
        decoration: InputDecoration(
          prefixIcon: CustomIcon(
            padding: 0,
            onIcon: widget.onPressed,
            widthIcon: widget.widthIcon,
            heightIcon: widget.heightIcon,
            pathIcon: widget.pathIcon,
          ),
          suffixIcon: widget.controller.text.isNotEmpty
              ? CustomIcon(
                  padding: 0,
                  onIcon: () {
                    widget.controller.clear();
                  },
                  widthIcon: widget.widthIcon2,
                  heightIcon: widget.heightIcon2,
                  pathIcon: widget.pathIcon2,
                )
              : null,
          hintText: widget.hintText,
          hintStyle: headlineRegular.copyWith(color: caption),
          filled: true,
          fillColor: widget.colorSearch,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius),
            ),
            borderSide: BorderSide(color: widget.borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius),
            ),
            borderSide: BorderSide(color: widget.borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius),
            ),
            borderSide: BorderSide(color: widget.borderColor),
          ),
        ),
      ),
    );
  }
}

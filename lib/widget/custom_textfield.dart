
import 'package:flutter/material.dart';
import 'package:sum3_uikit/colors.dart';
import 'package:sum3_uikit/styles.dart';
import 'package:sum3_uikit/widget/custom_icon.dart';

// Губайдуллина Камилла, 21.01.2026 14:38, текстовое поле для ввода данных
enum TextFieldType { text, data, password }

class CustomTextField extends StatelessWidget {
  final TextFieldType type; // Тип поля
  final bool isTitle; // Переменная для показа заголовка
  final String title; // Заголовок
  final TextEditingController controller; // Контроллер для поиска
  final Color colorTextField; // Цвет поиска
  final Color colorCursor; // Цвет курсора
  final String hintText; // Заголовок
  final Color borderColor; // Цвет границ
  final Color errorColor; // Цвет границ
  final Color focusColor; // Цвет границ
  final double borderRadius; // Закругление
  final VoidCallback onPressed; // Действие при нажатии на иконку
  final double widthIcon; // Ширина иконки
  final double heightIcon; // Высота иконки
  final String pathIcon; // Путь к иконке
  final String pathIcon2; // Путь к иконке
  final double padding; // Внешние отступы
  final String? error; // Текст ошибки

  const CustomTextField({
    super.key,
    required this.type,
    required this.isTitle,
    required this.title,
    required this.controller,
    required this.colorCursor,
    required this.hintText,
    required this.borderColor,
    required this.borderRadius,
    required this.onPressed,
    required this.widthIcon,
    required this.heightIcon,
    required this.pathIcon,
    required this.pathIcon2,
    required this.padding,
    this.error,
    required this.errorColor,
    required this.focusColor,
    required this.colorTextField,
  });

  @override
  Widget build(BuildContext context) {
    bool obscureText = true;
    final hasError = error != null;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        children: [
          if (isTitle)
            Row(
              children: [
                Text(title, style: captionRegular.copyWith(color: desc)),
                Spacer(),
              ],
            ),
          if (isTitle) SizedBox(height: 10,),
          TextField(
            controller: controller,
            cursorColor: colorCursor,
            obscureText: (type == TextFieldType.password) ? obscureText : true,
            decoration: InputDecoration(
              suffixIcon: (type == TextFieldType.password)
                  ? CustomIcon(
                onIcon: () {
                  obscureText = !obscureText;
                },
                widthIcon: widthIcon,
                heightIcon: heightIcon,
                pathIcon: obscureText ? pathIcon : pathIcon2,
              )
                  : null,
              hintText: hintText,
              hintStyle: headlineRegular.copyWith(color: caption),
              filled: true,
              fillColor: hasError ? error_textfield : colorTextField,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                borderSide: BorderSide(
                  color: hasError ? errorColor : borderColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                borderSide: BorderSide(
                  color: hasError ? errorColor : borderColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                borderSide: BorderSide(
                  color: hasError ? errorColor : focusColor,
                ),
              ),
            ),
          ),
          if (hasError)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Text(error!, style: captionRegular.copyWith(color: errorColor)),
                  Spacer(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
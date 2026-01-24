import 'package:flutter/material.dart';
import 'package:sum3_uikit/colors.dart';
import 'package:sum3_uikit/styles.dart';
import 'package:sum3_uikit/widget/custom_icon.dart';

// Тип текстового поля
enum TextFieldType { text, data, password }

// Губайдуллина Камилла, 21.01.2026 14:38, текстовое поле для ввода данных
class CustomTextField extends StatefulWidget {
  final TextFieldType type; // Тип поля
  final TextInputType keyboardType; // Тип клавиатуры
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
  final VoidCallback? onPressed; // Действие при нажатии на иконку
  final double? widthIcon; // Ширина иконки
  final double? heightIcon; // Высота иконки
  final String? pathIcon; // Путь к иконке
  final String? pathIcon2; // Путь к иконке
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
    required this.colorTextField, required this.keyboardType,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final hasError = widget.error != null;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.padding),
      child: Column(
        children: [
          if (widget.isTitle)
            Row(
              children: [
                Text(widget.title, style: captionRegular.copyWith(color: desc)),
                Spacer(),
              ],
            ),
          if (widget.isTitle) SizedBox(height: 10),
          TextField(
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            cursorColor: widget.colorCursor,
            obscureText: (widget.type == TextFieldType.password)
                ? obscureText
                : false,
            decoration: InputDecoration(
              suffixIcon: widget.type == TextFieldType.password
                  ? CustomIcon(
                      onIcon: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      widthIcon: widget.widthIcon!,
                      heightIcon: widget.heightIcon!,
                      pathIcon: obscureText
                          ? widget.pathIcon!
                          : widget.pathIcon2!,
                    )
                  : null,
              hintText: widget.hintText,
              hintStyle: headlineRegular.copyWith(color: caption),
              filled: true,
              fillColor: hasError ? error_textfield : widget.colorTextField,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
                borderSide: BorderSide(
                  color: hasError ? widget.errorColor : widget.borderColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
                borderSide: BorderSide(
                  color: hasError ? widget.errorColor : widget.borderColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
                borderSide: BorderSide(
                  color: hasError ? widget.errorColor : widget.focusColor,
                ),
              ),
            ),
          ),
          if (hasError)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Text(
                    widget.error!,
                    style: captionRegular.copyWith(color: widget.errorColor),
                  ),
                  Spacer(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

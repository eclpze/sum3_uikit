import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:sum3_uikit/colors.dart';
import 'package:sum3_uikit/styles.dart';
import 'package:sum3_uikit/widget/custom_icon.dart';

// Тип кнопки
enum ButtonType { primary, inactive, secondary, tetriary, chips, cart, login }

// Губайдуллина Камилла, 21.01.2026 14:54, кнопка
class CustomButton extends StatelessWidget {
  final ButtonType type; // Тип кнопки
  final String textButton; // Текст кнопки
  final String? price; // Параметр для типа cart
  final double widthButton; // Ширина кнопки
  final double heightButton; // Высота кнопки
  final Color colorButton; // Цвет кнопки
  final Color colorText; // Цвет текста
  final Color? colorBorder; // Цвет границ
  final double borderRadius; // Закругление
  final VoidCallback onPressed; // Действие при нажатии на кнопку
  final VoidCallback? onIcon; // Действие при нажатии на иконку
  final double? widthIcon; // Ширина иконки
  final double? heightIcon; // Высота иконки
  final String? pathIcon; // Путь к иконке
  final bool? isSelected; // Параметр для типа chips
  final double padding; // Внешние отступы

  const CustomButton({
    super.key,
    required this.textButton,
    this.price,
    required this.widthButton,
    required this.heightButton,
    required this.colorButton,
    required this.colorText,
    this.colorBorder,
    required this.borderRadius,
    required this.onPressed,
    this.widthIcon,
    this.heightIcon,
    this.pathIcon,
    this.isSelected,
    required this.padding,
    required this.type,
    this.onIcon,
  });

  @override
  Widget build(BuildContext context) {
    if (type == ButtonType.cart) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            fixedSize: Size(widthButton, heightButton),
            minimumSize: Size(widthButton, heightButton),
            backgroundColor: colorButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            ),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: onIcon!,
                child: SvgPicture.asset(
                  pathIcon!,
                  width: widthIcon!,
                  height: heightIcon!,
                ),
              ),
              SizedBox(width: 15),
              Text(
                textButton,
                overflow: TextOverflow.ellipsis,
                style: title3Semibold.copyWith(color: colorText),
              ),
              Spacer(),
              Text(
                price!,
                overflow: TextOverflow.ellipsis,
                style: title3Semibold.copyWith(color: colorText),
              ),
            ],
          ),
        ),
      );
    }
    if (type == ButtonType.login) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            fixedSize: Size(widthButton, heightButton),
            minimumSize: Size(widthButton, heightButton),
            backgroundColor: colorButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              side: BorderSide(color: colorBorder!),
            ),
          ),
          child: Row(
            children: [
              Spacer(),
              CustomIcon(
                padding: 0,
                onIcon: onIcon!,
                widthIcon: widthIcon!,
                heightIcon: heightIcon!,
                pathIcon: pathIcon!,
              ),
              SizedBox(width: 5),
              Text(
                textButton,
                overflow: TextOverflow.ellipsis,
                style: title3Semibold.copyWith(color: colorText),
              ),
              Spacer(),
            ],
          ),
        ),
      );
    }
    if (type == ButtonType.chips) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            fixedSize: Size(widthButton, heightButton),
            minimumSize: Size(widthButton, heightButton),
            backgroundColor: isSelected! ? accent : colorButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            ),
          ),
          child: Text(
            textButton,
            overflow: TextOverflow.ellipsis,
            style: title3Semibold.copyWith(
              color: isSelected! ? white : colorText,
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            fixedSize: Size(widthButton, heightButton),
            minimumSize: Size(widthButton, heightButton),
            backgroundColor: colorButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              side: (type == ButtonType.secondary)
                  ? BorderSide(color: colorBorder!)
                  : BorderSide.none,
            ),
          ),
          child: Text(
            textButton,
            overflow: TextOverflow.ellipsis,
            style: title3Semibold.copyWith(color: colorText),
          ),
        ),
      );
    }
  }
}

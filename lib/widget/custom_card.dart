import 'package:flutter/material.dart';
import 'package:sum3_uikit/colors.dart';
import 'package:sum3_uikit/styles.dart';
import 'package:sum3_uikit/widget/custom_button.dart';
import 'package:sum3_uikit/widget/custom_counter.dart';
import 'package:sum3_uikit/widget/custom_icon.dart';


enum CardType { primary, cart, project }

// Губайдуллина Камилла, 22.01.2026 20:34,
class CustomCard extends StatelessWidget {
  final CardType type; // Тип карточки
  final Color colorCard; // Цвет карточки
  final String title; // Заголовок
  final double widthTitle; // Ширина заголовка
  final double borderRadius; // Закругление
  final String text; // Текст
  final String? price; // Текст для cart и primary
  final VoidCallback? onIcon; // Действие при нажатии на иконку
  final double? widthIcon; // Ширина иконки
  final double? heightIcon; // Высота иконки
  final String? pathIcon; // Путь к иконке
  final double padding; // Отступы
  final bool? inCart; // Переменная для primary
  final Color? colorCounter; // Цвет счетчика
  final double? radiusCounter; // Закругление
  final VoidCallback? onPlus; // Действие при нажатии на иконку
  final double? widthPlus; // Ширина иконки
  final double? heightPlus; // Высота иконки
  final String? pathPlus; // Путь к иконке
  final VoidCallback? onMinus; // Действие при нажатии на иконку
  final double? widthMinus; // Ширина иконки
  final double? heightMinus; // Высота иконки
  final String? pathMinus; // Путь к иконке
  final double margin; //
  final String? textButton; // Текст кнопки
  final String? textButton2; // Текст кнопки 2
  final double? widthButton; // Ширина кнопки
  final double? heightButton; // Высота кнопки
  final Color? colorButton; // Цвет кнопки
  final Color? colorText; // Цвет текста
  final Color? colorButton2; // Цвет кнопки 2
  final Color? colorText2; // Цвет текста 2
  final double? radiusButton; // Закругление
  final VoidCallback? onPressed; // Действие при нажатии на кнопку
  final double? paddingButton; // Внешние отступы
  final Color? colorBorder; // Цвет границ

  const CustomCard({
    super.key,
    required this.type,
    required this.colorCard,
    required this.title,
    required this.widthTitle,
    required this.borderRadius,
    required this.text,
    this.price,
    this.onIcon,
    this.widthIcon,
    this.heightIcon,
    this.pathIcon,
    required this.padding,
    this.inCart,
    this.colorCounter,
    this.radiusCounter,
    this.onPlus,
    this.widthPlus,
    this.heightPlus,
    this.pathPlus,
    this.onMinus,
    this.widthMinus,
    this.heightMinus,
    this.pathMinus,
    required this.margin,
    this.textButton,
    this.widthButton,
    this.heightButton,
    this.colorButton,
    this.colorText,
    this.radiusButton,
    this.onPressed,
    this.paddingButton,
    this.colorBorder,
    this.textButton2,
    this.colorButton2,
    this.colorText2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: margin, vertical: margin/2),
      child: Card(
        color: colorCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (type == CardType.cart)
                Row(
                  children: [
                    SizedBox(
                      width: widthTitle,
                      child: Text(title, style: headlineMedium),
                    ),
                    Spacer(),
                    CustomIcon(
                      onIcon: onIcon!,
                      widthIcon: widthIcon!,
                      heightIcon: heightIcon!,
                      pathIcon: pathIcon!,
                    ),
                  ],
                ),
              if (type == CardType.primary || type == CardType.project)
                SizedBox(
                  width: widthTitle,
                  child: Text(title, style: headlineMedium),
                ),
              SizedBox(height: 20),
              if (type == CardType.cart)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex: 2, child: Text(price!, style: title3Medium)),
                    Text(text, style: textRegular),
                    SizedBox(width: 10),
                    CustomCounter(
                      color: colorCounter!,
                      borderRadius: radiusCounter!,
                      onPlus: onPlus!,
                      widthPlus: widthPlus!,
                      heightPlus: heightPlus!,
                      pathPlus: pathPlus!,
                      onMinus: onMinus!,
                      widthMinus: widthMinus!,
                      heightMinus: heightMinus!,
                      pathMinus: pathMinus!,
                    ),
                  ],
                ),
              if (type == CardType.primary)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text,
                          style: captionSemibold.copyWith(color: caption),
                        ),
                        SizedBox(height: 4),
                        Text(price!, style: title3Medium),
                      ],
                    ),
                    Spacer(),
                    CustomButton(
                      textButton: inCart! ? textButton! : textButton2!,
                      widthButton: widthButton!,
                      heightButton: heightButton!,
                      colorButton: inCart! ? colorButton! : colorButton2!,
                      colorText: inCart! ? colorText! : colorText2!,
                      borderRadius: radiusButton!,
                      onPressed: onPressed!,
                      padding: paddingButton!,
                      type: inCart! ? ButtonType.primary : ButtonType.secondary,
                      colorBorder: colorBorder!,
                    ),
                  ],
                ),
              if (type == CardType.project)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [Text(
                    text,
                    style: captionSemibold.copyWith(color: caption),
                  ),
                    Spacer(),
                    CustomButton(
                      textButton: textButton!,
                      widthButton: widthButton!,
                      heightButton: heightButton!,
                      colorButton: colorButton!,
                      colorText: colorText!,
                      borderRadius: radiusButton!,
                      onPressed: onPressed!,
                      padding: paddingButton!,
                      type: ButtonType.primary,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
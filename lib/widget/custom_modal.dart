import 'package:flutter/material.dart';
import 'package:sum3_uikit/colors.dart';
import 'package:sum3_uikit/styles.dart';
import 'package:sum3_uikit/widget/custom_button.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sum3_uikit/widget/custom_icon.dart';

// Губайдуллина Камилла, 22.01.2026 18:22, модальное окно для показа информации
class CustomModal {
  static void show({
    required BuildContext context, // Контекст приложения
    required double borderRadiusModal, // Закругление формы модального окна
    required Color colorModal, // Цвет окна
    final VoidCallback? onIcon, // Действие при нажатии на иконку
    final double? widthIcon, // Ширина иконки
    final double? heightIcon, // Высота иконки
    final String? pathIcon, // Путь к иконке
    final String? title, // Заголовок
    final double? widthTitle, // Ширина заголовка
    required bool hasButton, // Переменная для показа кнопки
    final ButtonType? type, // Тип кнопки
    final String? textButton, // Текст кнопки
    final double? widthButton, // Ширина кнопки
    final double? heightButton, // Высота кнопки
    final Color? colorButton, // Цвет кнопки
    final Color? colorText, // Цвет текста
    final double? borderRadius, // Закругление
    final VoidCallback? onPressed, // Действие при нажатии на кнопку
    final double? paddingButton, // Внешние отступы
    required String text1, // Текст 1
    final String? text2, // Текст 2
    final String? text3, // Текст 3
    final String? text4, // Текст 4
    final VoidCallback? onText1, //
    final VoidCallback? onText2, //
    required double padding, // Отступы
  }) {
    showMaterialModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadiusModal)),
      ),
      backgroundColor: colorModal,
      clipBehavior: Clip.antiAlias,
      builder: (context) => Container(
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: widthTitle,
                  child: Text(title!, style: title2Semibold),
                ),
                Spacer(),
                CustomIcon(
                  padding: 0,
                  onIcon: onIcon!,
                  widthIcon: widthIcon!,
                  heightIcon: heightIcon!,
                  pathIcon: pathIcon!,
                ),
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: onText1,
              child: Text(
                text1,
                style: headlineMedium.copyWith(color: caption),
              ),
            ),
            SizedBox(height: 10),
            if (text2 != null)
              GestureDetector(
                onTap: onText2,
                child: Text(text2, style: textRegular),
              ),
            SizedBox(height: 40),
            if (text3 != null)
              Text(text3, style: headlineMedium.copyWith(color: caption)),
            SizedBox(height: 10),
            if (text4 != null) Text(text4, style: textRegular),
            SizedBox(height: 20),
            if (hasButton &&
                textButton != null &&
                widthButton != null &&
                heightButton != null &&
                colorText != null &&
                colorButton != null &&
                borderRadius != null &&
                onPressed != null &&
                paddingButton != null &&
                type != null)
              Row(
                children: [
                  Spacer(),
                  CustomButton(
                    textButton: textButton,
                    widthButton: widthButton,
                    heightButton: heightButton,
                    colorButton: colorButton,
                    colorText: colorText,
                    borderRadius: borderRadius,
                    onPressed: onPressed,
                    padding: paddingButton,
                    type: type,
                  ),
                  Spacer(),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

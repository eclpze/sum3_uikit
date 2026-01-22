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
    required VoidCallback onIcon, // Действие при нажатии на иконку
    required double widthIcon, // Ширина иконки
    required double heightIcon, // Высота иконки
    required String pathIcon, // Путь к иконке
    required String title, // Заголовок
    required double widthTitle, // Ширина заголовка
    required bool hasButton, // Переменная для показа кнопки
    required ButtonType? type, // Тип кнопки
    required String? textButton, // Текст кнопки
    required double? widthButton, // Ширина кнопки
    required double? heightButton, // Высота кнопки
    required Color? colorButton, // Цвет кнопки
    required Color? colorText, // Цвет текста
    required double? borderRadius, // Закругление
    required VoidCallback? onPressed, // Действие при нажатии на кнопку
    required double? paddingButton, // Внешние отступы
    required String text1, // Текст 1
    required String? text2, // Текст 2
    required String? text3, // Текст 3
    required String? text4, // Текст 4
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
                  child: Text(title, style: title2Semibold),
                ),
                Spacer(),
                CustomIcon(
                  onIcon: onIcon,
                  widthIcon: widthIcon,
                  heightIcon: heightIcon,
                  pathIcon: pathIcon,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(text1, style: headlineMedium.copyWith(color: caption)),
            SizedBox(height: 10),
            if (text2 != null) Text(text2, style: textRegular),
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
                type != null)  Row(
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
                Spacer()
              ],
            )

          ],
        ),
      ),
    );
  }
}
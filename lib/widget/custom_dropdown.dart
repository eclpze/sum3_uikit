import 'package:flutter/material.dart';
import 'package:sum3_uikit/colors.dart';
import 'package:sum3_uikit/styles.dart';

// Тип выпадающего списка
enum DropDownType { no_smiles, smiles }

// Губайдуллина Камилла, 21.01.2026 13:54, выпадающий список
class CustomDropDown extends StatefulWidget {
  final DropDownType type; // Тип списка
  final String hint; // Заголовок списка
  final List<String> title; // Список вариантов
  final List<String>? smile; // Список смайликов
  final double borderRadius; // Закругление
  final Color color; // Цвет списка
  final double padding; // Внешние отступы
  final double margin; // Внутренние отступы
  final String? error; // Текст ошибки
  final bool isTitle; //
  final String mainTitle; //
  final ValueChanged<String?>? onChanged; //
  final double titlePadding; //

  const CustomDropDown({
    super.key,
    required this.type,
    required this.title,
    this.smile,
    required this.borderRadius,
    required this.color,
    required this.padding,
    required this.margin,
    required this.hint,
    this.error,
    this.onChanged,
    required this.isTitle,
    required this.mainTitle,
    required this.titlePadding,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedIndex; // Выбранный элемент

  @override
  Widget build(BuildContext context) {
    bool hasError = widget.error != null;

    return Column(
      children: [
        if (widget.isTitle)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.titlePadding),
            child: Row(
              children: [
                Text(
                  widget.mainTitle,
                  style: captionRegular.copyWith(color: desc),
                ),
                Spacer(),
              ],
            ),
          ),
        if (widget.isTitle) SizedBox(height: 10),
        Container(
          height: 55,
          margin: EdgeInsets.symmetric(horizontal: widget.margin),
          padding: EdgeInsets.symmetric(horizontal: widget.padding),
          decoration: BoxDecoration(
            color: hasError ? error_textfield : widget.color,
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius),
            ),
            border: Border.all(color: hasError ? error : input_stroke),
          ),
          child: Center(
            child: DropdownButton(
              isExpanded: true,
              underline: SizedBox.shrink(),
              dropdownColor: widget.color,
              value: selectedIndex,
              hint: Text(
                widget.hint,
                style: headlineRegular.copyWith(color: caption),
              ),
              items: List.generate(
                widget.title.length,
                (index) => DropdownMenuItem(
                  value: widget.title[index],
                  child: (widget.type == DropDownType.smiles)
                      ? Row(
                          children: [
                            Text(widget.smile![index], style: headlineRegular),
                            SizedBox(width: 5),
                            Text(widget.title[index], style: headlineRegular),
                          ],
                        )
                      : Text(widget.title[index], style: headlineRegular),
                ),
              ),
              onChanged: (newValue) {
                setState(() {
                  selectedIndex = newValue;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(newValue);
                }
              },
            ),
          ),
        ),
        if (hasError)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Text(
                  widget.error!,
                  style: captionRegular.copyWith(color: error),
                ),
                Spacer(),
              ],
            ),
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

// Губайдуллина Камилла, 22.01.2026 20:24, кнопка-переключатель
class CustomToggleButton extends StatefulWidget {
  final double widthToggle; // Ширина кнопки-переключателя
  final double heightToggle; // Высота кнопки-переключателя
  final double sizeToggle; // Размер переключателя
  final Color colorToggle; // Цвет перелючателя
  final Color colorActive; // Цвет активной кнопки-переключателя
  final Color colorInactive; // Цвет отключенной кнопки-переключателя
  final bool initialValue; // Переменная для изменения цвета

  const CustomToggleButton({
    super.key,
    required this.widthToggle,
    required this.heightToggle,
    required this.sizeToggle,
    required this.colorToggle,
    required this.colorActive,
    required this.colorInactive,
    this.initialValue = false,
  });

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: widget.widthToggle,
      height: widget.heightToggle,
      activeColor: widget.colorActive,
      inactiveColor: widget.colorInactive,
      toggleColor: widget.colorToggle,
      value: _value,
      onToggle: (bool value) {
        setState(() {
          _value = value;
        });
      },
    );
  }
}

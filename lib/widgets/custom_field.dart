import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final double borderRadius;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool obscureText;
  final bool expands;
  final TextEditingController textEditingController;
  final double containerH;
  final double containerW;
  final EdgeInsetsGeometry containerPadding;
  final EdgeInsetsGeometry contentPadding;
  final bool enabled;
  final Function onEditingComplete;

  CustomTextField({
    @required this.hintText,
    this.borderRadius = 100,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.expands = false,
    @required this.textEditingController,
    this.containerH,
    this.containerW,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.containerPadding,
    this.enabled = true,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerH,
      width: containerW,
      padding: containerPadding,
      child: TextField(
        enabled: enabled,
        controller: textEditingController,
        obscureText: obscureText,
        expands: expands,
        maxLines: expands ? null : 1,
        decoration: InputDecoration(
          contentPadding: contentPadding,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          border: InputBorder.none,
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onEditingComplete: onEditingComplete,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
    );
  }
}

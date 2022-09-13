import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function function;
  final bool isSolidColor;
  final Color textColor;
  final Color buttonColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const CustomButton({
    @required this.text,
    @required this.buttonColor,
    @required this.function,
    this.isSolidColor = true,
    @required this.textColor,
    this.borderRadius = 100,
    this.padding = const EdgeInsets.all(18),
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: padding,
        backgroundColor: isSolidColor ? buttonColor : Colors.white,
        side: isSolidColor ? null : BorderSide(width: 1.0, color: buttonColor),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
        shadowColor: Colors.black,
        elevation: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      onPressed: () => function(),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final String assetImg;
  final Function onTap;
  final Color bgColor;
  final Color iconColor;
  final EdgeInsetsGeometry padding;
  final double iconSize;

  CustomIconButton({
    @required this.assetImg,
    @required this.onTap,
    this.padding,
    this.bgColor,
    this.iconColor,
    this.iconSize = 35,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      visualDensity: VisualDensity(),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onPressed: () => onTap(),
      icon: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Image(
          image: AssetImage(assetImg),
          color: iconColor,
        ),
      ),
      iconSize: iconSize,
    );
  }
}

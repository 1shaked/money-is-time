import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key? key,
    required this.margin,
    required this.padding,
    required this.boxRadius,
    required this.buttonStatus,
    required this.tapping,
    required this.buttonText,
    required this.hasSwitch,
  }) : super(key: key);

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry boxRadius;
  final bool buttonStatus;
  final void Function(bool) tapping;
  final String buttonText;
  final bool hasSwitch;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: boxRadius,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            buttonText,
            style: Theme.of(context).textTheme.headline3,
          ),
          if (hasSwitch)
            CupertinoSwitch(
              value: buttonStatus,
              onChanged: tapping,
            ),
        ],
      ),
    );
  }
}

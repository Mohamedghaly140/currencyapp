import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:currencyapp/core/resources/values_manager.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final bool loading;
  final Color? indicatorBackgroundColor;
  final Color? foregroundColor;
  final Widget? widget;
  final BorderSide? side;
  final EdgeInsetsGeometry? padding;
  final bool isOutlined;
  final IconAlignment iconAlignment;

  const AppButton({
    super.key,
    this.onPressed,
    required this.text,
    this.height,
    this.loading = false,
    this.textStyle,
    this.backgroundColor,
    this.indicatorBackgroundColor,
    this.widget,
    this.width,
    this.foregroundColor,
    this.side,
    this.padding,
    this.isOutlined = false,
    this.iconAlignment = IconAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    Widget buttonChild = loading
        ? CupertinoActivityIndicator(
            color: indicatorBackgroundColor ?? Colors.white,
          )
        : Text(text, style: textStyle, textAlign: TextAlign.center);

    final buttonStyle = isOutlined
        ? Theme.of(context).outlinedButtonTheme.style
        : Theme.of(context).elevatedButtonTheme.style?.copyWith(
            side: WidgetStateProperty.all(side),
            padding: WidgetStateProperty.all(padding),
            backgroundColor: WidgetStateProperty.all(
              onPressed == null
                  ? Colors.blue.withValues(alpha: 0.5)
                  : backgroundColor ?? Colors.blue,
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s8),
              ),
            ),
            foregroundColor: WidgetStateProperty.all(
              foregroundColor ?? Colors.white,
            ),
            elevation: WidgetStateProperty.all(0),
          );

    return SizedBox(
      height: height ?? 52,
      width: width ?? double.infinity,
      child: isOutlined
          ? OutlinedButton.icon(
              icon: widget,
              label: buttonChild,
              style: buttonStyle,
              iconAlignment: iconAlignment,
              onPressed: loading ? null : onPressed,
            )
          : ElevatedButton.icon(
              icon: widget,
              label: buttonChild,
              style: buttonStyle,
              iconAlignment: iconAlignment,
              onPressed: loading ? null : onPressed,
            ),
    );
  }
}

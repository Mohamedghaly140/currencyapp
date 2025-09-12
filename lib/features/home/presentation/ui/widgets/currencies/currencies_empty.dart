import 'package:currencyapp/core/resources/font_manager.dart';
import 'package:currencyapp/core/resources/styles_manager.dart';
import 'package:currencyapp/core/resources/values_manager.dart';
import 'package:currencyapp/core/shared/widgets/app_button.dart';
import 'package:flutter/material.dart';

class CurrenciesEmpty extends StatelessWidget {
  final String? errorMessage;
  final VoidCallback? onPressed;

  const CurrenciesEmpty({super.key, this.errorMessage, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppPadding.p40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Icon(Icons.currency_exchange, size: AppSize.s40)),
          SizedBox(height: AppSize.s16),
          Text(
            errorMessage ?? 'No currencies found',
            textAlign: TextAlign.center,
            style: AppTextStyle.getSemiBoldStyle(
              fontSize: FontSize.s17,
              color: Colors.black12,
            ),
          ),
          SizedBox(height: AppSize.s4),
          Text(
            errorMessage ?? 'No currencies found',
            textAlign: TextAlign.center,
            style: AppTextStyle.getRegularStyle(
              fontSize: FontSize.s15,
              color: Colors.black12,
            ),
          ),
          if (errorMessage != null) ...[
            SizedBox(height: AppSize.s24),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(AppSize.s8),
              ),
              child: AppButton(
                onPressed: onPressed,
                height: AppSize.s44,
                widget: errorMessage != null ? Icon(Icons.refresh) : null,
                text: errorMessage != null ? 'Try Again' : 'Shortlist Me',
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

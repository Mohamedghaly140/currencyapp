import 'package:currencyapp/core/navigation/named_routes.dart';
import 'package:currencyapp/core/resources/font_manager.dart';
import 'package:currencyapp/core/resources/styles_manager.dart';
import 'package:currencyapp/core/resources/values_manager.dart';
import 'package:currencyapp/core/shared/widgets/custom_cached_image.dart';
import 'package:currencyapp/features/home/data/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CurrencyListItem extends StatelessWidget {
  final CountryModel country;

  const CurrencyListItem({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSize.s16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.withValues(alpha: 0.1), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          spacing: AppSpacing.md,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top row with flag, info, and currency symbol
            Row(
              spacing: AppSpacing.lg,
              children: [
                // Flag container with rounded corners
                Container(
                  width: AppSize.s36,
                  height: AppSize.s36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.withValues(alpha: 0.2),
                      width: 0.5,
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: CustomCachedImage(
                    mediaUrl: country.flagUrl,
                    width: AppSize.s36,
                    height: AppSize.s36,
                    fit: BoxFit.cover,
                  ),
                ),

                // Country and currency info
                Expanded(
                  child: Column(
                    spacing: AppSpacing.xs,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        country.name ?? 'Unknown Country',
                        style: AppTextStyle.getMediumStyle(
                          fontSize: FontSize.s16,
                          color: const Color(0xFF1A1A1A),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        country.currencyName ?? 'Unknown Currency',
                        style: AppTextStyle.getRegularStyle(
                          fontSize: FontSize.s14,
                          color: const Color(0xFF666666),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (country.currencyId != null)
                        Text(
                          country.currencyId!,
                          style: AppTextStyle.getRegularStyle(
                            fontSize: FontSize.s12,
                            color: const Color(0xFF999999),
                          ),
                        ),
                    ],
                  ),
                ),

                // Currency symbol with background
                if (country.currencySymbol != null &&
                    country.currencySymbol!.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p12,
                      vertical: AppPadding.p8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6366F1).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppSize.s8),
                    ),
                    child: Text(
                      country.currencySymbol!,
                      style: AppTextStyle.getSemiBoldStyle(
                        fontSize: FontSize.s16,
                        color: const Color(0xFF6366F1),
                      ),
                    ),
                  ),
              ],
            ),

            // Call to action button with outline style
            OutlinedButton(
              onPressed: () {
                context.pushNamed(
                  NamedRoutes.historicalData.routeName,
                  queryParameters: {'currencyId': country.currencyId},
                );
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF6366F1), width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p16,
                  vertical: AppPadding.p12,
                ),
                backgroundColor: Colors.transparent,
              ),
              child: Text(
                "View Historical Data Last 7 Days",
                style: AppTextStyle.getMediumStyle(
                  fontSize: FontSize.s14,
                  color: const Color(0xFF6366F1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

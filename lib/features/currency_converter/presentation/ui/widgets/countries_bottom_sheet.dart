import 'package:currencyapp/core/dependency_injection/injection.dart';
import 'package:currencyapp/core/resources/app_border_radius.dart';
import 'package:currencyapp/core/resources/font_manager.dart';
import 'package:currencyapp/core/resources/styles_manager.dart';
import 'package:currencyapp/core/resources/values_manager.dart';
import 'package:currencyapp/core/shared/widgets/custom_cached_image.dart';
import 'package:currencyapp/features/currency_converter/presentation/logic/currency_converter_cubit.dart';
import 'package:currencyapp/features/home/presentation/logic/currency_cubit.dart';
import 'package:currencyapp/features/home/data/models/country_model.dart';
import 'package:currencyapp/features/home/presentation/ui/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CountriesBottomSheet extends StatelessWidget {
  const CountriesBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: getIt<CurrencyCubit>()),
          BlocProvider.value(value: getIt<CurrencyConverterCubit>()),
        ],
        child: const CountriesBottomSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currencyCubit = getIt<CurrencyCubit>();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppBorderRadius.lg),
          topRight: Radius.circular(AppBorderRadius.lg),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Column(
        spacing: AppSpacing.xl,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Select Currency',
            textAlign: TextAlign.center,
            style: AppTextStyle.getMediumStyle(
              fontSize: FontSize.s20,
              color: Colors.black87,
            ),
          ),
          SearchTextField(),
          Expanded(
            child: BlocBuilder<CurrencyCubit, CurrencyState>(
              buildWhen: (previous, current) =>
                  previous.searchQuery != current.searchQuery,
              builder: (context, state) {
                final countries = currencyCubit.filteredCountries;
                if (countries.isEmpty) {
                  return Center(
                    child: Text(
                      'No Results Found For Your Search',
                      style: AppTextStyle.getMediumStyle(
                        fontSize: FontSize.s16,
                        color: Colors.black87,
                      ),
                    ),
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: countries.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      getIt<CurrencyConverterCubit>().setTargetCountry(
                        countries[index],
                      );
                      context.pop();
                    },
                    child: CountryItemBuilder(
                      index: index,
                      countries: countries,
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      SizedBox(height: AppSize.s16),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CountryItemBuilder extends StatelessWidget {
  final int index;
  final List<CountryModel> countries;
  const CountryItemBuilder({
    super.key,
    required this.index,
    required this.countries,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyConverterCubit, CurrencyConverterState>(
      buildWhen: (previous, current) =>
          previous.targetCountry == countries[index],
      builder: (context, state) => CountryItem(
        country: countries[index],
        isSelected: state.targetCountry == countries[index],
      ),
    );
  }
}

class CountryItem extends StatelessWidget {
  final CountryModel country;
  final bool isSelected;

  const CountryItem({
    super.key,
    required this.country,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFF6366F1).withValues(alpha: 0.1)
            : Colors.white,
        borderRadius: BorderRadius.circular(AppSize.s12),
        border: Border.all(
          color: isSelected
              ? const Color(0xFF6366F1)
              : Colors.grey.withValues(alpha: 0.1),
          width: isSelected ? 1.5 : 1,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        leading: Container(
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
        title: Text(
          country.name ?? '',
          style: AppTextStyle.getMediumStyle(
            fontSize: FontSize.s16,
            color: const Color(0xFF1A1A1A),
          ),
        ),
        subtitle: Text(
          country.currencyName ?? '',
          style: AppTextStyle.getRegularStyle(
            fontSize: FontSize.s14,
            color: const Color(0xFF666666),
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p12,
            vertical: AppPadding.p8,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF6366F1).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
          child: Text(
            country.currencySymbol ?? '',
            style: AppTextStyle.getSemiBoldStyle(
              fontSize: FontSize.s16,
              color: const Color(0xFF6366F1),
            ),
          ),
        ),
      ),
    );
  }
}

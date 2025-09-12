import 'package:currencyapp/features/home/presentation/ui/widgets/currencies/currencies_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:currencyapp/core/utils/enums/enums.dart';
import 'package:currencyapp/core/dependency_injection/injection.dart';
import 'package:currencyapp/features/home/presentation/logic/currency_cubit.dart';
import 'package:currencyapp/features/home/presentation/ui/widgets/currencies/currencies_empty.dart';

class Currencies extends StatelessWidget {
  const Currencies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyCubit, CurrencyState>(
      builder: (context, state) {
        final isLoading = state.getCountryRequestState == RequestState.loading;
        if (state.getCountryRequestState == RequestState.error) {
          return Expanded(
            child: CurrenciesEmpty(
              errorMessage: state.errorMessage,
              onPressed: () {
                getIt<CurrencyCubit>().getCountries();
              },
            ),
          );
        } else {
          return Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                if (isLoading) return;
                await getIt<CurrencyCubit>().getCountries();
              },
              child: CurrenciesList(
                countries: getIt<CurrencyCubit>().filteredCountries,
                isLoading: isLoading,
              ),
            ),
          );
        }
      },
    );
  }
}

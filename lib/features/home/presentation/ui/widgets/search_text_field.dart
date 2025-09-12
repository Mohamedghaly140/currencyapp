import 'package:currencyapp/core/dependency_injection/injection.dart';
import 'package:currencyapp/core/resources/values_manager.dart';
import 'package:currencyapp/features/home/presentation/logic/currency_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<CurrencyCubit>();
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: TextFormField(
        controller: cubit.searchController,
        onChanged: cubit.setSearchQuery,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          suffixIcon: BlocBuilder<CurrencyCubit, CurrencyState>(
            buildWhen: (previous, current) =>
                previous.searchQuery != current.searchQuery,
            builder: (context, state) {
              if (state.searchQuery.isEmpty) {
                return const SizedBox.shrink();
              }
              return IconButton(
                onPressed: () {
                  cubit.clearSearchQuery();
                },
                icon: Icon(Icons.clear),
              );
            },
          ),
        ),
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}

import 'package:currencyapp/core/networking/api_result.dart';
import 'package:currencyapp/core/usecases/usecases.dart';
import 'package:currencyapp/features/home/data/models/country_model.dart';
import 'package:currencyapp/features/home/data/models/currency_model.dart';
import 'package:currencyapp/features/home/domain/usecases/get_countries_usecase.dart';
import 'package:currencyapp/features/home/domain/usecases/get_currencies_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:currencyapp/core/utils/enums/enums.dart';
import 'package:injectable/injectable.dart';

part 'currency_state.dart';
part 'currency_cubit.freezed.dart';

@lazySingleton
class CurrencyCubit extends Cubit<CurrencyState> {
  final GetCurrenciesUseCase getCurrenciesUseCase;
  final GetCountriesUseCase getCountriesUseCase;

  CurrencyCubit({
    required this.getCurrenciesUseCase,
    required this.getCountriesUseCase,
  }) : super(const _CurrencyState());

  late TextEditingController searchController;

  initController() {
    searchController = TextEditingController();
  }

  disposeController() {
    searchController.dispose();
  }

  // Cached search results to avoid recomputation when query and lists are unchanged
  List<CountryModel> _cachedFilteredCountries = const [];
  String _lastSearchQuery = '';
  List<CountryModel>? _lastCountriesRef;

  // Filter countries by currencyId or currencyName for current UI list
  List<CountryModel> get filteredCountries {
    final String query = state.searchQuery.trim().toLowerCase();
    final bool isSameQuery = query == _lastSearchQuery;
    final bool isSameListRef = identical(_lastCountriesRef, state.countries);

    if (isSameQuery && isSameListRef) return _cachedFilteredCountries;

    if (query.isEmpty) {
      _cachedFilteredCountries = state.countries;
    } else {
      _cachedFilteredCountries = state.countries
          .where((c) {
            final id = (c.currencyId ?? '').toLowerCase();
            final name = (c.currencyName ?? '').toLowerCase();
            return id.contains(query) || name.contains(query);
          })
          .toList(growable: false);
    }

    _lastSearchQuery = query;
    _lastCountriesRef = state.countries;
    return _cachedFilteredCountries;
  }

  void setSearchQuery(String searchQuery) async {
    final String trimmed = searchQuery.trim();
    if (trimmed == state.searchQuery) return;
    emit(state.copyWith(searchQuery: trimmed));
  }

  clearSearchQuery() {
    searchController.clear();
    setSearchQuery('');
  }

  Future<void> getCurrencies() async {
    emit(state.copyWith(getCurrencyRequestState: RequestState.loading));
    final result = await getCurrenciesUseCase.call(NoParams());
    result.when(
      success: (response) {
        emit(
          state.copyWith(
            currencies: response.results.values.toList(),
            getCurrencyRequestState: RequestState.loaded,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            getCurrencyRequestState: RequestState.error,
            errorMessage: error.message,
          ),
        );
      },
    );
  }

  Future<void> getCountries() async {
    emit(state.copyWith(getCountryRequestState: RequestState.loading));
    final result = await getCountriesUseCase.call(NoParams());
    result.when(
      success: (response) {
        emit(
          state.copyWith(
            countries: response.results.values.toList(),
            getCountryRequestState: RequestState.loaded,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            getCountryRequestState: RequestState.error,
            errorMessage: error.message,
          ),
        );
      },
    );
  }
}

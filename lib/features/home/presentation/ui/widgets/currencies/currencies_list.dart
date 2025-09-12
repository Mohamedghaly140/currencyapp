import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:currencyapp/core/resources/values_manager.dart';
import 'package:currencyapp/features/home/data/models/country_model.dart';
import 'package:currencyapp/features/home/presentation/ui/widgets/currencies/currencies_empty.dart';
import 'package:currencyapp/features/home/presentation/ui/widgets/currencies/currency_list_item.dart';

class CurrenciesList extends StatefulWidget {
  final bool isLoading;
  final List<CountryModel> countries;
  final Future<void> Function()? onLoadMore;

  const CurrenciesList({
    super.key,
    required this.countries,
    this.isLoading = false,
    this.onLoadMore,
  });

  @override
  State<CurrenciesList> createState() => _CurrenciesListState();
}

class _CurrenciesListState extends State<CurrenciesList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      widget.onLoadMore?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading && widget.countries.isEmpty) {
      return Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: const CurrenciesEmpty(),
        ),
      );
    }

    return Skeletonizer(
      enabled: widget.isLoading,
      child: ListView.separated(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemCount: widget.isLoading ? 1 : widget.countries.length,
        itemBuilder: (context, index) => CurrencyListItem(
          country: widget.isLoading
              ? CountryModel(
                  alpha3: 'EGY',
                  currencyId: 'EGP',
                  currencyName: 'Egyptian pound',
                  currencySymbol: '£',
                  id: 'EG',
                  name: 'Egypt',
                )
              : widget.countries[index],
        ),
        separatorBuilder: (context, index) => SizedBox(height: AppSize.s16),
        padding: EdgeInsetsDirectional.only(bottom: AppPadding.p20),
      ),
    );
  }
}

import 'package:currencyapp/core/dependency_injection/injection.dart';
import 'package:currencyapp/core/navigation/named_routes.dart';
import 'package:currencyapp/core/navigation/route_observer.dart';
import 'package:currencyapp/features/currency_converter/presentation/logic/currency_converter_cubit.dart';
import 'package:currencyapp/features/currency_converter/presentation/ui/screens/currency_converter_screen.dart';
import 'package:currencyapp/features/historical_data/presentation/logic/historical_data_cubit.dart';
import 'package:currencyapp/features/historical_data/presentation/ui/screens/historical_data_screen.dart';
import 'package:currencyapp/features/home/presentation/logic/currency_cubit.dart';
import 'package:currencyapp/features/home/presentation/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

abstract class RouterGenerator {
  static AppNavigationObserver observers = AppNavigationObserver();

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    observers: [observers],
    initialLocation: NamedRoutes.home.routeName,
    routes: <RouteBase>[
      GoRoute(
        path: NamedRoutes.home.routeName,
        name: NamedRoutes.home.routeName,
        builder: (context, state) {
          return BlocProvider.value(
            value: getIt<CurrencyCubit>(),
            child: const HomeScreen(),
          );
        },
      ),
      GoRoute(
        path: NamedRoutes.historicalData.routeName,
        name: NamedRoutes.historicalData.routeName,
        builder: (context, state) {
          final currencyId = state.uri.queryParameters['currencyId'];
          return BlocProvider.value(
            value: getIt<HistoricalDataCubit>(),
            child: HistoricalDataScreen(currencyId: currencyId),
          );
        },
      ),
      GoRoute(
        path: NamedRoutes.currencyConverter.routeName,
        name: NamedRoutes.currencyConverter.routeName,
        builder: (context, state) {
          return BlocProvider.value(
            value: getIt<CurrencyConverterCubit>(),
            child: const CurrencyConverterScreen(),
          );
        },
      ),
    ],
  );
}

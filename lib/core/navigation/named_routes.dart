enum NamedRoutes {
  home('/home'),

  historicalData('/historical-data'),

  currencyConverter('/currency-converter');

  final String routeName;

  const NamedRoutes(this.routeName);
}

enum NamedRoutes {
  home('/home'),

  historicalData('/historical-data');

  final String routeName;

  const NamedRoutes(this.routeName);
}

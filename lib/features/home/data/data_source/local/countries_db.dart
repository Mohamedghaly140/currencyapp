import 'package:drift/drift.dart';

class CountriesDb extends Table {
  // final String? alpha3;
  // final String? currencyId;
  // final String? currencyName;
  // final String? currencySymbol;
  // final String? id;
  // final String? name;

  TextColumn get id => text().withLength(min: 1, max: 10).nullable()();
  TextColumn get alpha3 => text().withLength(min: 1, max: 10).nullable()();
  TextColumn get currencyId => text().withLength(min: 1, max: 10).nullable()();
  TextColumn get currencyName =>
      text().withLength(min: 1, max: 100).nullable()();
  TextColumn get currencySymbol =>
      text().withLength(min: 1, max: 20).nullable()();
  TextColumn get name => text().withLength(min: 1, max: 100).nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

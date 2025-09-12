import 'package:currencyapp/features/home/data/data_source/local/countries_db.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DriftDatabase(tables: [CountriesDb])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  // @override
  // MigrationStrategy get migration => MigrationStrategy(
  //   onCreate: (Migrator m) {
  //     return m.createAll();
  //   },
  //   onUpgrade: (Migrator m, int from, int to) async {
  //     if (from < 2) {
  //       // Drop and recreate the table with new constraints
  //       await m.deleteTable('countries_db');
  //       await m.createTable(countriesDb);
  //     }
  //   },
  // );

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'currency_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}

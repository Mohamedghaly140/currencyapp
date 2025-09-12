// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CountriesDbTable extends CountriesDb
    with TableInfo<$CountriesDbTable, CountriesDbData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountriesDbTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 10,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _alpha3Meta = const VerificationMeta('alpha3');
  @override
  late final GeneratedColumn<String> alpha3 = GeneratedColumn<String>(
    'alpha3',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 10,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currencyIdMeta = const VerificationMeta(
    'currencyId',
  );
  @override
  late final GeneratedColumn<String> currencyId = GeneratedColumn<String>(
    'currency_id',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 10,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currencyNameMeta = const VerificationMeta(
    'currencyName',
  );
  @override
  late final GeneratedColumn<String> currencyName = GeneratedColumn<String>(
    'currency_name',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currencySymbolMeta = const VerificationMeta(
    'currencySymbol',
  );
  @override
  late final GeneratedColumn<String> currencySymbol = GeneratedColumn<String>(
    'currency_symbol',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    alpha3,
    currencyId,
    currencyName,
    currencySymbol,
    name,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'countries_db';
  @override
  VerificationContext validateIntegrity(
    Insertable<CountriesDbData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('alpha3')) {
      context.handle(
        _alpha3Meta,
        alpha3.isAcceptableOrUnknown(data['alpha3']!, _alpha3Meta),
      );
    }
    if (data.containsKey('currency_id')) {
      context.handle(
        _currencyIdMeta,
        currencyId.isAcceptableOrUnknown(data['currency_id']!, _currencyIdMeta),
      );
    }
    if (data.containsKey('currency_name')) {
      context.handle(
        _currencyNameMeta,
        currencyName.isAcceptableOrUnknown(
          data['currency_name']!,
          _currencyNameMeta,
        ),
      );
    }
    if (data.containsKey('currency_symbol')) {
      context.handle(
        _currencySymbolMeta,
        currencySymbol.isAcceptableOrUnknown(
          data['currency_symbol']!,
          _currencySymbolMeta,
        ),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CountriesDbData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CountriesDbData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      ),
      alpha3: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alpha3'],
      ),
      currencyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_id'],
      ),
      currencyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_name'],
      ),
      currencySymbol: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_symbol'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CountriesDbTable createAlias(String alias) {
    return $CountriesDbTable(attachedDatabase, alias);
  }
}

class CountriesDbData extends DataClass implements Insertable<CountriesDbData> {
  final String? id;
  final String? alpha3;
  final String? currencyId;
  final String? currencyName;
  final String? currencySymbol;
  final String? name;
  final DateTime createdAt;
  final DateTime updatedAt;
  const CountriesDbData({
    this.id,
    this.alpha3,
    this.currencyId,
    this.currencyName,
    this.currencySymbol,
    this.name,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || alpha3 != null) {
      map['alpha3'] = Variable<String>(alpha3);
    }
    if (!nullToAbsent || currencyId != null) {
      map['currency_id'] = Variable<String>(currencyId);
    }
    if (!nullToAbsent || currencyName != null) {
      map['currency_name'] = Variable<String>(currencyName);
    }
    if (!nullToAbsent || currencySymbol != null) {
      map['currency_symbol'] = Variable<String>(currencySymbol);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CountriesDbCompanion toCompanion(bool nullToAbsent) {
    return CountriesDbCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      alpha3: alpha3 == null && nullToAbsent
          ? const Value.absent()
          : Value(alpha3),
      currencyId: currencyId == null && nullToAbsent
          ? const Value.absent()
          : Value(currencyId),
      currencyName: currencyName == null && nullToAbsent
          ? const Value.absent()
          : Value(currencyName),
      currencySymbol: currencySymbol == null && nullToAbsent
          ? const Value.absent()
          : Value(currencySymbol),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CountriesDbData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CountriesDbData(
      id: serializer.fromJson<String?>(json['id']),
      alpha3: serializer.fromJson<String?>(json['alpha3']),
      currencyId: serializer.fromJson<String?>(json['currencyId']),
      currencyName: serializer.fromJson<String?>(json['currencyName']),
      currencySymbol: serializer.fromJson<String?>(json['currencySymbol']),
      name: serializer.fromJson<String?>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'alpha3': serializer.toJson<String?>(alpha3),
      'currencyId': serializer.toJson<String?>(currencyId),
      'currencyName': serializer.toJson<String?>(currencyName),
      'currencySymbol': serializer.toJson<String?>(currencySymbol),
      'name': serializer.toJson<String?>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CountriesDbData copyWith({
    Value<String?> id = const Value.absent(),
    Value<String?> alpha3 = const Value.absent(),
    Value<String?> currencyId = const Value.absent(),
    Value<String?> currencyName = const Value.absent(),
    Value<String?> currencySymbol = const Value.absent(),
    Value<String?> name = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => CountriesDbData(
    id: id.present ? id.value : this.id,
    alpha3: alpha3.present ? alpha3.value : this.alpha3,
    currencyId: currencyId.present ? currencyId.value : this.currencyId,
    currencyName: currencyName.present ? currencyName.value : this.currencyName,
    currencySymbol: currencySymbol.present
        ? currencySymbol.value
        : this.currencySymbol,
    name: name.present ? name.value : this.name,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CountriesDbData copyWithCompanion(CountriesDbCompanion data) {
    return CountriesDbData(
      id: data.id.present ? data.id.value : this.id,
      alpha3: data.alpha3.present ? data.alpha3.value : this.alpha3,
      currencyId: data.currencyId.present
          ? data.currencyId.value
          : this.currencyId,
      currencyName: data.currencyName.present
          ? data.currencyName.value
          : this.currencyName,
      currencySymbol: data.currencySymbol.present
          ? data.currencySymbol.value
          : this.currencySymbol,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CountriesDbData(')
          ..write('id: $id, ')
          ..write('alpha3: $alpha3, ')
          ..write('currencyId: $currencyId, ')
          ..write('currencyName: $currencyName, ')
          ..write('currencySymbol: $currencySymbol, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    alpha3,
    currencyId,
    currencyName,
    currencySymbol,
    name,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountriesDbData &&
          other.id == this.id &&
          other.alpha3 == this.alpha3 &&
          other.currencyId == this.currencyId &&
          other.currencyName == this.currencyName &&
          other.currencySymbol == this.currencySymbol &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CountriesDbCompanion extends UpdateCompanion<CountriesDbData> {
  final Value<String?> id;
  final Value<String?> alpha3;
  final Value<String?> currencyId;
  final Value<String?> currencyName;
  final Value<String?> currencySymbol;
  final Value<String?> name;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CountriesDbCompanion({
    this.id = const Value.absent(),
    this.alpha3 = const Value.absent(),
    this.currencyId = const Value.absent(),
    this.currencyName = const Value.absent(),
    this.currencySymbol = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CountriesDbCompanion.insert({
    this.id = const Value.absent(),
    this.alpha3 = const Value.absent(),
    this.currencyId = const Value.absent(),
    this.currencyName = const Value.absent(),
    this.currencySymbol = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<CountriesDbData> custom({
    Expression<String>? id,
    Expression<String>? alpha3,
    Expression<String>? currencyId,
    Expression<String>? currencyName,
    Expression<String>? currencySymbol,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (alpha3 != null) 'alpha3': alpha3,
      if (currencyId != null) 'currency_id': currencyId,
      if (currencyName != null) 'currency_name': currencyName,
      if (currencySymbol != null) 'currency_symbol': currencySymbol,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CountriesDbCompanion copyWith({
    Value<String?>? id,
    Value<String?>? alpha3,
    Value<String?>? currencyId,
    Value<String?>? currencyName,
    Value<String?>? currencySymbol,
    Value<String?>? name,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return CountriesDbCompanion(
      id: id ?? this.id,
      alpha3: alpha3 ?? this.alpha3,
      currencyId: currencyId ?? this.currencyId,
      currencyName: currencyName ?? this.currencyName,
      currencySymbol: currencySymbol ?? this.currencySymbol,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (alpha3.present) {
      map['alpha3'] = Variable<String>(alpha3.value);
    }
    if (currencyId.present) {
      map['currency_id'] = Variable<String>(currencyId.value);
    }
    if (currencyName.present) {
      map['currency_name'] = Variable<String>(currencyName.value);
    }
    if (currencySymbol.present) {
      map['currency_symbol'] = Variable<String>(currencySymbol.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountriesDbCompanion(')
          ..write('id: $id, ')
          ..write('alpha3: $alpha3, ')
          ..write('currencyId: $currencyId, ')
          ..write('currencyName: $currencyName, ')
          ..write('currencySymbol: $currencySymbol, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CountriesDbTable countriesDb = $CountriesDbTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [countriesDb];
}

typedef $$CountriesDbTableCreateCompanionBuilder =
    CountriesDbCompanion Function({
      Value<String?> id,
      Value<String?> alpha3,
      Value<String?> currencyId,
      Value<String?> currencyName,
      Value<String?> currencySymbol,
      Value<String?> name,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$CountriesDbTableUpdateCompanionBuilder =
    CountriesDbCompanion Function({
      Value<String?> id,
      Value<String?> alpha3,
      Value<String?> currencyId,
      Value<String?> currencyName,
      Value<String?> currencySymbol,
      Value<String?> name,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$CountriesDbTableFilterComposer
    extends Composer<_$AppDatabase, $CountriesDbTable> {
  $$CountriesDbTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get alpha3 => $composableBuilder(
    column: $table.alpha3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencyId => $composableBuilder(
    column: $table.currencyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencyName => $composableBuilder(
    column: $table.currencyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencySymbol => $composableBuilder(
    column: $table.currencySymbol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CountriesDbTableOrderingComposer
    extends Composer<_$AppDatabase, $CountriesDbTable> {
  $$CountriesDbTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get alpha3 => $composableBuilder(
    column: $table.alpha3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencyId => $composableBuilder(
    column: $table.currencyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencyName => $composableBuilder(
    column: $table.currencyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencySymbol => $composableBuilder(
    column: $table.currencySymbol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CountriesDbTableAnnotationComposer
    extends Composer<_$AppDatabase, $CountriesDbTable> {
  $$CountriesDbTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get alpha3 =>
      $composableBuilder(column: $table.alpha3, builder: (column) => column);

  GeneratedColumn<String> get currencyId => $composableBuilder(
    column: $table.currencyId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currencyName => $composableBuilder(
    column: $table.currencyName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currencySymbol => $composableBuilder(
    column: $table.currencySymbol,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CountriesDbTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CountriesDbTable,
          CountriesDbData,
          $$CountriesDbTableFilterComposer,
          $$CountriesDbTableOrderingComposer,
          $$CountriesDbTableAnnotationComposer,
          $$CountriesDbTableCreateCompanionBuilder,
          $$CountriesDbTableUpdateCompanionBuilder,
          (
            CountriesDbData,
            BaseReferences<_$AppDatabase, $CountriesDbTable, CountriesDbData>,
          ),
          CountriesDbData,
          PrefetchHooks Function()
        > {
  $$CountriesDbTableTableManager(_$AppDatabase db, $CountriesDbTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CountriesDbTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CountriesDbTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CountriesDbTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String?> id = const Value.absent(),
                Value<String?> alpha3 = const Value.absent(),
                Value<String?> currencyId = const Value.absent(),
                Value<String?> currencyName = const Value.absent(),
                Value<String?> currencySymbol = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CountriesDbCompanion(
                id: id,
                alpha3: alpha3,
                currencyId: currencyId,
                currencyName: currencyName,
                currencySymbol: currencySymbol,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String?> id = const Value.absent(),
                Value<String?> alpha3 = const Value.absent(),
                Value<String?> currencyId = const Value.absent(),
                Value<String?> currencyName = const Value.absent(),
                Value<String?> currencySymbol = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CountriesDbCompanion.insert(
                id: id,
                alpha3: alpha3,
                currencyId: currencyId,
                currencyName: currencyName,
                currencySymbol: currencySymbol,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CountriesDbTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CountriesDbTable,
      CountriesDbData,
      $$CountriesDbTableFilterComposer,
      $$CountriesDbTableOrderingComposer,
      $$CountriesDbTableAnnotationComposer,
      $$CountriesDbTableCreateCompanionBuilder,
      $$CountriesDbTableUpdateCompanionBuilder,
      (
        CountriesDbData,
        BaseReferences<_$AppDatabase, $CountriesDbTable, CountriesDbData>,
      ),
      CountriesDbData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CountriesDbTableTableManager get countriesDb =>
      $$CountriesDbTableTableManager(_db, _db.countriesDb);
}

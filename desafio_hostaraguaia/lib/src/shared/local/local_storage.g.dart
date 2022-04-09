// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_storage.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class BaseStorageData extends DataClass implements Insertable<BaseStorageData> {
  final String title;
  final int id;
  final String image;
  final String type;
  BaseStorageData(
      {required this.title,
      required this.id,
      required this.image,
      required this.type});
  factory BaseStorageData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BaseStorageData(
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image'])!,
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['title'] = Variable<String>(title);
    map['id'] = Variable<int>(id);
    map['image'] = Variable<String>(image);
    map['type'] = Variable<String>(type);
    return map;
  }

  BaseStorageCompanion toCompanion(bool nullToAbsent) {
    return BaseStorageCompanion(
      title: Value(title),
      id: Value(id),
      image: Value(image),
      type: Value(type),
    );
  }

  factory BaseStorageData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BaseStorageData(
      title: serializer.fromJson<String>(json['title']),
      id: serializer.fromJson<int>(json['id']),
      image: serializer.fromJson<String>(json['image']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'title': serializer.toJson<String>(title),
      'id': serializer.toJson<int>(id),
      'image': serializer.toJson<String>(image),
      'type': serializer.toJson<String>(type),
    };
  }

  BaseStorageData copyWith(
          {String? title, int? id, String? image, String? type}) =>
      BaseStorageData(
        title: title ?? this.title,
        id: id ?? this.id,
        image: image ?? this.image,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('BaseStorageData(')
          ..write('title: $title, ')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(title, id, image, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BaseStorageData &&
          other.title == this.title &&
          other.id == this.id &&
          other.image == this.image &&
          other.type == this.type);
}

class BaseStorageCompanion extends UpdateCompanion<BaseStorageData> {
  final Value<String> title;
  final Value<int> id;
  final Value<String> image;
  final Value<String> type;
  const BaseStorageCompanion({
    this.title = const Value.absent(),
    this.id = const Value.absent(),
    this.image = const Value.absent(),
    this.type = const Value.absent(),
  });
  BaseStorageCompanion.insert({
    required String title,
    required int id,
    required String image,
    required String type,
  })  : title = Value(title),
        id = Value(id),
        image = Value(image),
        type = Value(type);
  static Insertable<BaseStorageData> custom({
    Expression<String>? title,
    Expression<int>? id,
    Expression<String>? image,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (title != null) 'title': title,
      if (id != null) 'id': id,
      if (image != null) 'image': image,
      if (type != null) 'type': type,
    });
  }

  BaseStorageCompanion copyWith(
      {Value<String>? title,
      Value<int>? id,
      Value<String>? image,
      Value<String>? type}) {
    return BaseStorageCompanion(
      title: title ?? this.title,
      id: id ?? this.id,
      image: image ?? this.image,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BaseStorageCompanion(')
          ..write('title: $title, ')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $BaseStorageTable extends BaseStorage
    with TableInfo<$BaseStorageTable, BaseStorageData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BaseStorageTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [title, id, image, type];
  @override
  String get aliasedName => _alias ?? 'base_storage';
  @override
  String get actualTableName => 'base_storage';
  @override
  VerificationContext validateIntegrity(Insertable<BaseStorageData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  BaseStorageData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BaseStorageData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BaseStorageTable createAlias(String alias) {
    return $BaseStorageTable(attachedDatabase, alias);
  }
}

abstract class _$BaseStorageDatabase extends GeneratedDatabase {
  _$BaseStorageDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $BaseStorageTable baseStorage = $BaseStorageTable(this);
  late final BaseStorageDao baseStorageDao =
      BaseStorageDao(this as BaseStorageDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [baseStorage];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$BaseStorageDaoMixin on DatabaseAccessor<BaseStorageDatabase> {
  $BaseStorageTable get baseStorage => attachedDatabase.baseStorage;
}

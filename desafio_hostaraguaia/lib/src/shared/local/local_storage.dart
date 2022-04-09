import 'package:moor_flutter/moor_flutter.dart';
part 'local_storage.g.dart';

class BaseStorage extends Table {
  TextColumn get title => text()();
  IntColumn get id => integer()();
  TextColumn get image => text()();
  TextColumn get type => text()();

}


@UseMoor(tables: [BaseStorage], daos: [BaseStorageDao])
class BaseStorageDatabase extends _$BaseStorageDatabase {
  BaseStorageDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: "db.sqlite", logStatements: true));
  int get schemaVersion => 1;
}

@UseDao(tables: [BaseStorage])
class BaseStorageDao extends DatabaseAccessor<BaseStorageDatabase>
    with _$BaseStorageDaoMixin {
  final BaseStorageDatabase db;
  BaseStorageDao(this.db) : super(db);

  Future<List<BaseStorageData>> getAll() => select(baseStorage).get();
  Future insert(BaseStorageData baseStorageData) =>
      into(baseStorage).insert(baseStorageData);
  Future deleteById(BaseStorageData baseStorageData) =>
      (delete(baseStorage)..where((t) => t.id.equals(baseStorageData.id))).go();
}
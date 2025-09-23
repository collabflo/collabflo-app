import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _userType = await secureStorage.getString('ff_userType') ?? _userType;
    });
    await _safeInitAsync(() async {
      _isDrawerOpen =
          await secureStorage.getBool('ff_isDrawerOpen') ?? _isDrawerOpen;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _userType = '';
  String get userType => _userType;
  set userType(String value) {
    _userType = value;
    secureStorage.setString('ff_userType', value);
  }

  void deleteUserType() {
    secureStorage.delete(key: 'ff_userType');
  }

  bool _isDrawerOpen = true;
  bool get isDrawerOpen => _isDrawerOpen;
  set isDrawerOpen(bool value) {
    _isDrawerOpen = value;
    secureStorage.setBool('ff_isDrawerOpen', value);
  }

  void deleteIsDrawerOpen() {
    secureStorage.delete(key: 'ff_isDrawerOpen');
  }

  String _searchText = '';
  String get searchText => _searchText;
  set searchText(String value) {
    _searchText = value;
  }

  final _profileCacheManager = FutureRequestManager<List<ProfilesRecord>>();
  Future<List<ProfilesRecord>> profileCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ProfilesRecord>> Function() requestFn,
  }) =>
      _profileCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProfileCacheCache() => _profileCacheManager.clear();
  void clearProfileCacheCacheKey(String? uniqueKey) =>
      _profileCacheManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}

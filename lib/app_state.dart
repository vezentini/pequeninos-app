import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';

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
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _email = await secureStorage.getString('ff_email') ?? _email;
    });
    await _safeInitAsync(() async {
      _name = await secureStorage.getString('ff_name') ?? _name;
    });
    await _safeInitAsync(() async {
      _profile = await secureStorage.getString('ff_profile') ?? _profile;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
    secureStorage.setString('ff_email', value);
  }

  void deleteEmail() {
    secureStorage.delete(key: 'ff_email');
  }

  String _name = '';
  String get name => _name;
  set name(String value) {
    _name = value;
    secureStorage.setString('ff_name', value);
  }

  void deleteName() {
    secureStorage.delete(key: 'ff_name');
  }

  String _profile = '';
  String get profile => _profile;
  set profile(String value) {
    _profile = value;
    secureStorage.setString('ff_profile', value);
  }

  void deleteProfile() {
    secureStorage.delete(key: 'ff_profile');
  }

  DateTime? _date = DateTime.fromMillisecondsSinceEpoch(1710795000000);
  DateTime? get date => _date;
  set date(DateTime? value) {
    _date = value;
  }

  int _id = 0;
  int get id => _id;
  set id(int value) {
    _id = value;
  }

  List<String> _studentIds = [];
  List<String> get studentIds => _studentIds;
  set studentIds(List<String> value) {
    _studentIds = value;
  }

  void addToStudentIds(String value) {
    _studentIds.add(value);
  }

  void removeFromStudentIds(String value) {
    _studentIds.remove(value);
  }

  void removeAtIndexFromStudentIds(int index) {
    _studentIds.removeAt(index);
  }

  void updateStudentIdsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _studentIds[index] = updateFn(_studentIds[index]);
  }

  void insertAtIndexInStudentIds(int index, String value) {
    _studentIds.insert(index, value);
  }
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
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}

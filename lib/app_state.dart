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
      _id = await secureStorage.getString('ff_id') ?? _id;
    });
    await _safeInitAsync(() async {
      _profile = await secureStorage.getString('ff_profile') ?? _profile;
    });
    await _safeInitAsync(() async {
      _studentsId =
          await secureStorage.getStringList('ff_studentsId') ?? _studentsId;
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

  String _id = '';
  String get id => _id;
  set id(String value) {
    _id = value;
    secureStorage.setString('ff_id', value);
  }

  void deleteId() {
    secureStorage.delete(key: 'ff_id');
  }

  DateTime? _summaryDate = DateTime.fromMillisecondsSinceEpoch(1710180840000);
  DateTime? get summaryDate => _summaryDate;
  set summaryDate(DateTime? value) {
    _summaryDate = value;
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

  List<String> _studentsId = [];
  List<String> get studentsId => _studentsId;
  set studentsId(List<String> value) {
    _studentsId = value;
    secureStorage.setStringList('ff_studentsId', value);
  }

  void deleteStudentsId() {
    secureStorage.delete(key: 'ff_studentsId');
  }

  void addToStudentsId(String value) {
    _studentsId.add(value);
    secureStorage.setStringList('ff_studentsId', _studentsId);
  }

  void removeFromStudentsId(String value) {
    _studentsId.remove(value);
    secureStorage.setStringList('ff_studentsId', _studentsId);
  }

  void removeAtIndexFromStudentsId(int index) {
    _studentsId.removeAt(index);
    secureStorage.setStringList('ff_studentsId', _studentsId);
  }

  void updateStudentsIdAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _studentsId[index] = updateFn(_studentsId[index]);
    secureStorage.setStringList('ff_studentsId', _studentsId);
  }

  void insertAtIndexInStudentsId(int index, String value) {
    _studentsId.insert(index, value);
    secureStorage.setStringList('ff_studentsId', _studentsId);
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

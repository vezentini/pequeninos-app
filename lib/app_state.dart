import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _textFromHtmlEditor =
          prefs.getString('ff_textFromHtmlEditor') ?? _textFromHtmlEditor;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _email = 'vezentini@hotmail.com';
  String get email => _email;
  set email(String value) {
    _email = value;
  }

  String _name = 'Gustavo Vezentini';
  String get name => _name;
  set name(String value) {
    _name = value;
  }

  String _studentId = '1';
  String get studentId => _studentId;
  set studentId(String value) {
    _studentId = value;
  }

  String _id = '1';
  String get id => _id;
  set id(String value) {
    _id = value;
  }

  DateTime? _summaryDate = DateTime.fromMillisecondsSinceEpoch(1710180840000);
  DateTime? get summaryDate => _summaryDate;
  set summaryDate(DateTime? value) {
    _summaryDate = value;
  }

  String _textFromHtmlEditor = 'Resumo do dia...';
  String get textFromHtmlEditor => _textFromHtmlEditor;
  set textFromHtmlEditor(String value) {
    _textFromHtmlEditor = value;
    prefs.setString('ff_textFromHtmlEditor', value);
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

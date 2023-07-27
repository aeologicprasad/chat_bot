import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _apiKey = prefs.getString('ff_apiKey') ?? _apiKey;
    });
    _safeInit(() {
      _isDarkMode = prefs.getBool('ff_isDarkMode') ?? _isDarkMode;
    });
    _safeInit(() {
      _savedConversation =
          prefs.getStringList('ff_savedConversation')?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _savedConversation;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _apiKey = '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';
  String get apiKey => _apiKey;
  set apiKey(String _value) {
    _apiKey = _value;
    prefs.setString('ff_apiKey', _value);
  }

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool _value) {
    _isDarkMode = _value;
    prefs.setBool('ff_isDarkMode', _value);
  }

  List<dynamic> _currentConversation = [];
  List<dynamic> get currentConversation => _currentConversation;
  set currentConversation(List<dynamic> _value) {
    _currentConversation = _value;
  }

  void addToCurrentConversation(dynamic _value) {
    _currentConversation.add(_value);
  }

  void removeFromCurrentConversation(dynamic _value) {
    _currentConversation.remove(_value);
  }

  void removeAtIndexFromCurrentConversation(int _index) {
    _currentConversation.removeAt(_index);
  }

  void updateCurrentConversationAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _currentConversation[_index] = updateFn(_currentConversation[_index]);
  }

  List<dynamic> _savedConversation = [];
  List<dynamic> get savedConversation => _savedConversation;
  set savedConversation(List<dynamic> _value) {
    _savedConversation = _value;
    prefs.setStringList(
        'ff_savedConversation', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToSavedConversation(dynamic _value) {
    _savedConversation.add(_value);
    prefs.setStringList('ff_savedConversation',
        _savedConversation.map((x) => jsonEncode(x)).toList());
  }

  void removeFromSavedConversation(dynamic _value) {
    _savedConversation.remove(_value);
    prefs.setStringList('ff_savedConversation',
        _savedConversation.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromSavedConversation(int _index) {
    _savedConversation.removeAt(_index);
    prefs.setStringList('ff_savedConversation',
        _savedConversation.map((x) => jsonEncode(x)).toList());
  }

  void updateSavedConversationAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _savedConversation[_index] = updateFn(_savedConversation[_index]);
    prefs.setStringList('ff_savedConversation',
        _savedConversation.map((x) => jsonEncode(x)).toList());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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

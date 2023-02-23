import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('ff_userdata')) {
      try {
        _userdata = jsonDecode(prefs.getString('ff_userdata') ?? '');
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }

    _token = prefs.getString('ff_token') ?? _token;
    _isLogin = prefs.getBool('ff_isLogin') ?? _isLogin;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _count = 0;
  int get count => _count;
  set count(int _value) {
    _count = _value;
  }

  bool _isWishlist = false;
  bool get isWishlist => _isWishlist;
  set isWishlist(bool _value) {
    _isWishlist = _value;
  }

  List<int> _products = [];
  List<int> get products => _products;
  set products(List<int> _value) {
    _products = _value;
  }

  void addToProducts(int _value) {
    _products.add(_value);
  }

  void removeFromProducts(int _value) {
    _products.remove(_value);
  }

  void removeAtIndexFromProducts(int _index) {
    _products.removeAt(_index);
  }

  dynamic _userdata;
  dynamic get userdata => _userdata;
  set userdata(dynamic _value) {
    _userdata = _value;
    prefs.setString('ff_userdata', jsonEncode(_value));
  }

  String _token = '';
  String get token => _token;
  set token(String _value) {
    _token = _value;
    prefs.setString('ff_token', _value);
  }

  bool _isLogin = false;
  bool get isLogin => _isLogin;
  set isLogin(bool _value) {
    _isLogin = _value;
    prefs.setBool('ff_isLogin', _value);
  }

  List<int> _products2 = [];
  List<int> get products2 => _products2;
  set products2(List<int> _value) {
    _products2 = _value;
  }

  void addToProducts2(int _value) {
    _products2.add(_value);
  }

  void removeFromProducts2(int _value) {
    _products2.remove(_value);
  }

  void removeAtIndexFromProducts2(int _index) {
    _products2.removeAt(_index);
  }

  bool _isSeeMore = true;
  bool get isSeeMore => _isSeeMore;
  set isSeeMore(bool _value) {
    _isSeeMore = _value;
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

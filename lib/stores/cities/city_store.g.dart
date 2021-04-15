// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CityStore on _CityStore, Store {
  final _$companiesAtom = Atom(name: '_CityStore.companies');

  @override
  ObservableFuture<List<Company>> get companies {
    _$companiesAtom.reportRead();
    return super.companies;
  }

  @override
  set companies(ObservableFuture<List<Company>> value) {
    _$companiesAtom.reportWrite(value, super.companies, () {
      super.companies = value;
    });
  }

  final _$pageAtom = Atom(name: '_CityStore.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$_CityStoreActionController = ActionController(name: '_CityStore');

  @override
  Future<dynamic> getCompanies(City city) {
    final _$actionInfo = _$_CityStoreActionController.startAction(
        name: '_CityStore.getCompanies');
    try {
      return super.getCompanies(city);
    } finally {
      _$_CityStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> getMoreCompanies(dynamic city, dynamic page) {
    final _$actionInfo = _$_CityStoreActionController.startAction(
        name: '_CityStore.getMoreCompanies');
    try {
      return super.getMoreCompanies(city, page);
    } finally {
      _$_CityStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
companies: ${companies},
page: ${page}
    ''';
  }
}

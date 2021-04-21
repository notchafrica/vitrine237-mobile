// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStore, Store {
  final _$companiesAtom = Atom(name: '_SearchStore.companies');

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

  final _$qAtom = Atom(name: '_SearchStore.q');

  @override
  String get q {
    _$qAtom.reportRead();
    return super.q;
  }

  @override
  set q(String value) {
    _$qAtom.reportWrite(value, super.q, () {
      super.q = value;
    });
  }

  final _$cityAtom = Atom(name: '_SearchStore.city');

  @override
  String get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  final _$loadingAtom = Atom(name: '_SearchStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$_SearchStoreActionController = ActionController(name: '_SearchStore');

  @override
  Future<dynamic> getSearch(dynamic q) {
    final _$actionInfo = _$_SearchStoreActionController.startAction(
        name: '_SearchStore.getSearch');
    try {
      return super.getSearch(q);
    } finally {
      _$_SearchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCity(dynamic v) {
    final _$actionInfo = _$_SearchStoreActionController.startAction(
        name: '_SearchStore.setCity');
    try {
      return super.setCity(v);
    } finally {
      _$_SearchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQuery(dynamic v) {
    final _$actionInfo = _$_SearchStoreActionController.startAction(
        name: '_SearchStore.setQuery');
    try {
      return super.setQuery(v);
    } finally {
      _$_SearchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getQuery() {
    final _$actionInfo = _$_SearchStoreActionController.startAction(
        name: '_SearchStore.getQuery');
    try {
      return super.getQuery();
    } finally {
      _$_SearchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCityNull(dynamic v) {
    final _$actionInfo = _$_SearchStoreActionController.startAction(
        name: '_SearchStore.setCityNull');
    try {
      return super.setCityNull(v);
    } finally {
      _$_SearchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic search(dynamic q) {
    final _$actionInfo =
        _$_SearchStoreActionController.startAction(name: '_SearchStore.search');
    try {
      return super.search(q);
    } finally {
      _$_SearchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
companies: ${companies},
q: ${q},
city: ${city},
loading: ${loading}
    ''';
  }
}

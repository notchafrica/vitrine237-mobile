// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CompanyStore on _CompanyStore, Store {
  final _$popularAtom = Atom(name: '_CompanyStore.popular');

  @override
  ObservableFuture<List<Company>> get popular {
    _$popularAtom.reportRead();
    return super.popular;
  }

  @override
  set popular(ObservableFuture<List<Company>> value) {
    _$popularAtom.reportWrite(value, super.popular, () {
      super.popular = value;
    });
  }

  final _$trendingAtom = Atom(name: '_CompanyStore.trending');

  @override
  ObservableFuture<List<Company>> get trending {
    _$trendingAtom.reportRead();
    return super.trending;
  }

  @override
  set trending(ObservableFuture<List<Company>> value) {
    _$trendingAtom.reportWrite(value, super.trending, () {
      super.trending = value;
    });
  }

  final _$latestAtom = Atom(name: '_CompanyStore.latest');

  @override
  ObservableFuture<List<Company>> get latest {
    _$latestAtom.reportRead();
    return super.latest;
  }

  @override
  set latest(ObservableFuture<List<Company>> value) {
    _$latestAtom.reportWrite(value, super.latest, () {
      super.latest = value;
    });
  }

  final _$_CompanyStoreActionController =
      ActionController(name: '_CompanyStore');

  @override
  Future<dynamic> getPopular() {
    final _$actionInfo = _$_CompanyStoreActionController.startAction(
        name: '_CompanyStore.getPopular');
    try {
      return super.getPopular();
    } finally {
      _$_CompanyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> getTrending() {
    final _$actionInfo = _$_CompanyStoreActionController.startAction(
        name: '_CompanyStore.getTrending');
    try {
      return super.getTrending();
    } finally {
      _$_CompanyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> getLatest() {
    final _$actionInfo = _$_CompanyStoreActionController.startAction(
        name: '_CompanyStore.getLatest');
    try {
      return super.getLatest();
    } finally {
      _$_CompanyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
popular: ${popular},
trending: ${trending},
latest: ${latest}
    ''';
  }
}

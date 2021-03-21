// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStore, Store {
  final _$resultsAtom = Atom(name: '_SearchStore.results');

  @override
  ObservableFuture<SearchResult> get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(ObservableFuture<SearchResult> value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
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
  String toString() {
    return '''
results: ${results}
    ''';
  }
}

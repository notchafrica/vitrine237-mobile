// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'states_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StatesStore on _StatesStore, Store {
  final _$statesAtom = Atom(name: '_StatesStore.states');

  @override
  ObservableFuture<List<State>> get states {
    _$statesAtom.reportRead();
    return super.states;
  }

  @override
  set states(ObservableFuture<List<State>> value) {
    _$statesAtom.reportWrite(value, super.states, () {
      super.states = value;
    });
  }

  final _$companiesAtom = Atom(name: '_StatesStore.companies');

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

  final _$_StatesStoreActionController = ActionController(name: '_StatesStore');

  @override
  Future<dynamic> getStates() {
    final _$actionInfo = _$_StatesStoreActionController.startAction(
        name: '_StatesStore.getStates');
    try {
      return super.getStates();
    } finally {
      _$_StatesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> getCompanies(State state) {
    final _$actionInfo = _$_StatesStoreActionController.startAction(
        name: '_StatesStore.getCompanies');
    try {
      return super.getCompanies(state);
    } finally {
      _$_StatesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
states: ${states},
companies: ${companies}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CityStore on _CityStore, Store {
  Computed<bool> _$alreadyLoadedComputed;

  @override
  bool get alreadyLoaded =>
      (_$alreadyLoadedComputed ??= Computed<bool>(() => super.alreadyLoaded,
              name: '_CityStore.alreadyLoaded'))
          .value;

  final _$companiesAtom = Atom(name: '_CityStore.companies');

  @override
  ObservableFuture<CompanyResponse> get companies {
    _$companiesAtom.reportRead();
    return super.companies;
  }

  @override
  set companies(ObservableFuture<CompanyResponse> value) {
    _$companiesAtom.reportWrite(value, super.companies, () {
      super.companies = value;
    });
  }

  final _$citiesAtom = Atom(name: '_CityStore.cities');

  @override
  ObservableFuture<List<City>> get cities {
    _$citiesAtom.reportRead();
    return super.cities;
  }

  @override
  set cities(ObservableFuture<List<City>> value) {
    _$citiesAtom.reportWrite(value, super.cities, () {
      super.cities = value;
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

  final _$totalPageAtom = Atom(name: '_CityStore.totalPage');

  @override
  int get totalPage {
    _$totalPageAtom.reportRead();
    return super.totalPage;
  }

  @override
  set totalPage(int value) {
    _$totalPageAtom.reportWrite(value, super.totalPage, () {
      super.totalPage = value;
    });
  }

  final _$loadingAtom = Atom(name: '_CityStore.loading');

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
  dynamic getMoreCompanies(City city) {
    final _$actionInfo = _$_CityStoreActionController.startAction(
        name: '_CityStore.getMoreCompanies');
    try {
      return super.getMoreCompanies(city);
    } finally {
      _$_CityStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
companies: ${companies},
cities: ${cities},
page: ${page},
totalPage: ${totalPage},
loading: ${loading},
alreadyLoaded: ${alreadyLoaded}
    ''';
  }
}

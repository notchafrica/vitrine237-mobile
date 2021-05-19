// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoriesStore on _CategoriesStore, Store {
  final _$categoriesAtom = Atom(name: '_CategoriesStore.categories');

  @override
  ObservableFuture<List<Category>> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableFuture<List<Category>> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$companiesAtom = Atom(name: '_CategoriesStore.companies');

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

  final _$totalListAtom = Atom(name: '_CategoriesStore.totalList');

  @override
  List<Company> get totalList {
    _$totalListAtom.reportRead();
    return super.totalList;
  }

  @override
  set totalList(List<Company> value) {
    _$totalListAtom.reportWrite(value, super.totalList, () {
      super.totalList = value;
    });
  }

  final _$subsectorCompaniesAtom =
      Atom(name: '_CategoriesStore.subsectorCompanies');

  @override
  ObservableFuture<CompanyResponse> get subsectorCompanies {
    _$subsectorCompaniesAtom.reportRead();
    return super.subsectorCompanies;
  }

  @override
  set subsectorCompanies(ObservableFuture<CompanyResponse> value) {
    _$subsectorCompaniesAtom.reportWrite(value, super.subsectorCompanies, () {
      super.subsectorCompanies = value;
    });
  }

  final _$loadingMoreAtom = Atom(name: '_CategoriesStore.loadingMore');

  @override
  bool get loadingMore {
    _$loadingMoreAtom.reportRead();
    return super.loadingMore;
  }

  @override
  set loadingMore(bool value) {
    _$loadingMoreAtom.reportWrite(value, super.loadingMore, () {
      super.loadingMore = value;
    });
  }

  final _$_CategoriesStoreActionController =
      ActionController(name: '_CategoriesStore');

  @override
  Future<dynamic> getCategories() {
    final _$actionInfo = _$_CategoriesStoreActionController.startAction(
        name: '_CategoriesStore.getCategories');
    try {
      return super.getCategories();
    } finally {
      _$_CategoriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> getCompanies(Category state) {
    final _$actionInfo = _$_CategoriesStoreActionController.startAction(
        name: '_CategoriesStore.getCompanies');
    try {
      return super.getCompanies(state);
    } finally {
      _$_CategoriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> getCompaniesBySector(SubSector state) {
    final _$actionInfo = _$_CategoriesStoreActionController.startAction(
        name: '_CategoriesStore.getCompaniesBySector');
    try {
      return super.getCompaniesBySector(state);
    } finally {
      _$_CategoriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getMoreCompaniesBySector(SubSector state) {
    final _$actionInfo = _$_CategoriesStoreActionController.startAction(
        name: '_CategoriesStore.getMoreCompaniesBySector');
    try {
      return super.getMoreCompaniesBySector(state);
    } finally {
      _$_CategoriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<Company> getMoreCompanies(Category state) {
    final _$actionInfo = _$_CategoriesStoreActionController.startAction(
        name: '_CategoriesStore.getMoreCompanies');
    try {
      return super.getMoreCompanies(state);
    } finally {
      _$_CategoriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categories: ${categories},
companies: ${companies},
totalList: ${totalList},
subsectorCompanies: ${subsectorCompanies},
loadingMore: ${loadingMore}
    ''';
  }
}

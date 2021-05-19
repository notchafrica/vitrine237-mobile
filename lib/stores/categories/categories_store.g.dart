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

  final _$subsectorCompaniesAtom =
      Atom(name: '_CategoriesStore.subsectorCompanies');

  @override
  ObservableFuture<List<Company>> get subsectorCompanies {
    _$subsectorCompaniesAtom.reportRead();
    return super.subsectorCompanies;
  }

  @override
  set subsectorCompanies(ObservableFuture<List<Company>> value) {
    _$subsectorCompaniesAtom.reportWrite(value, super.subsectorCompanies, () {
      super.subsectorCompanies = value;
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
  String toString() {
    return '''
categories: ${categories},
companies: ${companies},
subsectorCompanies: ${subsectorCompanies}
    ''';
  }
}

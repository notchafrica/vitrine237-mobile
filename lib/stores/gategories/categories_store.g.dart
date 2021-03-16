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
  String toString() {
    return '''
categories: ${categories}
    ''';
  }
}

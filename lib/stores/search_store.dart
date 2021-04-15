import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:vitrine237/models/company.dart';
import 'package:vitrine237/providers/search_provider.dart';

part 'search_store.g.dart';

class SearchStore = _SearchStore with _$SearchStore;

abstract class _SearchStore with Store {
  @observable
  ObservableFuture<SearchResult> results;

  @action
  Future getSearch({String q, String city}) =>
      results = ObservableFuture(SearchProvider.search(code: q, city: city)
          .then((SearchResult result) => result));
}

class SearchResult {
  final List<Company> companies;
  final List<Category> sectors;

  SearchResult({this.companies, this.sectors});
}

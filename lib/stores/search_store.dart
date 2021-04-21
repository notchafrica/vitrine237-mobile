import 'package:mobx/mobx.dart';
import 'package:vitrine237/models/city.dart';
import 'package:vitrine237/models/company.dart';
import 'package:vitrine237/providers/search_provider.dart';

part 'search_store.g.dart';

class SearchStore = _SearchStore with _$SearchStore;

abstract class _SearchStore with Store {
  @observable
  ObservableFuture<List<Company>> companies;

  @observable
  String q;

  @observable
  String city;

  @observable
  bool loading = null;

  @action
  Future getSearch(q) =>
      companies = ObservableFuture(SearchProvider.search(code: q, city: city)
          .then((List<Company> result) {
        loading = false;
        return result;
      }));
  @action
  setCity(v) {
    city = v;
  }

  @action
  setQuery(v) {
    q = v;
  }

  @action
  getQuery() {
    return q;
  }

  @action
  setCityNull(v) {
    city = null;
  }

  @action
  search(q) {
    if (q != null) {
      getSearch(q);
    }
  }
}

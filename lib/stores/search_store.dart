import 'package:mobx/mobx.dart';
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
  Future dynamicSearch(q) {
    List<String> query = q.toString().split(",");

    print(query.length);

    loading = true;

    if (query.length > 0) {
      if (query.length > 1) {
        return companies = ObservableFuture(SearchProvider.search(
                code: query[0] != null ? query[0] : q,
                city: query[1] != null ? query[1] : null)
            .then((List<Company> result) {
          loading = false;
          return result;
        }));
      }

      return companies = ObservableFuture(
          SearchProvider.search(code: q).then((List<Company> result) {
        loading = false;
        return result;
      }));
    }

    return companies = ObservableFuture(
        SearchProvider.search(code: q).then((List<Company> result) {
      loading = false;
      return result;
    }));
  }

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
}

import 'package:mobx/mobx.dart';
import 'package:vitrine237/models/company.dart';
import 'package:vitrine237/providers/company_provider.dart';

part 'company_store.g.dart';

class CompanyStore = _CompanyStore with _$CompanyStore;

abstract class _CompanyStore with Store {
  @observable
  ObservableFuture<List<Company>> popular;

  @observable
  ObservableFuture<List<Company>> trending;

  @observable
  ObservableFuture<List<Company>> latest;

  @action
  Future getPopular() => popular = ObservableFuture(
          CompanyProvider.popular().then((List<Company> result) {
        print(result);
        return result;
      }));

  @action
  Future getTrending() => trending = ObservableFuture(
          CompanyProvider.trending().then((List<Company> result) {
        return result;
      }));
  @action
  Future getLatest() => latest = ObservableFuture(
          CompanyProvider.latest().then((List<Company> result) {
        return result;
      }));
}

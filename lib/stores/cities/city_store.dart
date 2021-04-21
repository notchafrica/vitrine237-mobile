import 'package:mobx/mobx.dart';
import 'package:vitrine237/models/city.dart';
import 'package:vitrine237/models/company.dart';
import 'package:vitrine237/providers/company_provider.dart';

part 'city_store.g.dart';

class CityStore = _CityStore with _$CityStore;

abstract class _CityStore with Store {
  @observable
  ObservableFuture<List<Company>> companies;

  @observable
  ObservableFuture<List<City>> cities;

  @observable
  int page = 1;
  @observable
  int totalPage = 0;
  @observable
  bool loading = false;

  @action
  Future getCompanies(City city) => companies = ObservableFuture(
          CompanyProvider.companiesByCity(city: city.slug, page: 1)
              .then((List<Company> result) {
        return result;
      }));

  /* @action
  Future find(q) => cities =
          ObservableFuture(SearchProvider.findCity(q).then((List<City> result) {
        return result;
      })); */

  @computed
  bool get alreadyLoaded => page == totalPage;
}

class CompaniesResult {
  final int page;
  final int totalPage;
  final List<Company> companies;

  CompaniesResult({this.page, this.totalPage, this.companies});
}

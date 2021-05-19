import 'package:mobx/mobx.dart';
import 'package:vitrine237/models/city.dart';
import 'package:vitrine237/models/company.dart';
import 'package:vitrine237/models/company_response.dart';
import 'package:vitrine237/providers/company_provider.dart';

part 'city_store.g.dart';

class CityStore = _CityStore with _$CityStore;

abstract class _CityStore with Store {
  @observable
  ObservableFuture<CompanyResponse> companies;

  @observable
  ObservableFuture<List<City>> cities;

  @observable
  int page = 1;
  @observable
  int totalPage = 0;
  @observable
  bool loading = false;

  @action
  Future getCompanies(City city) {
    return companies = ObservableFuture(
        CompanyProvider.companiesByCity(city: city.slug, page: 1).then((value) {
      return value;
    }));
  }

  @action
  getMoreCompanies(City city) {
    if (companies.result.current_page < companies.result.total_page &&
        !loading) {
      loading = true;
      CompanyProvider.companiesByCity(
              city: city.slug, page: companies.result.current_page + 1)
          .then((CompanyResponse value) {
        if (value.companies.length > 0) {
          companies.result.total_page = value.total_page;
          companies.result.current_page = value.current_page;
          companies.result.companies.addAll(value.companies);
          loading = false;
        } else {
          loading = false;
        }
      });
    }
  }

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

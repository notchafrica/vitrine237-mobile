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
  int page = 1;
  int totalPage = 0;
  List<Company> totalCompanies = [];

  @action
  Future getCompanies(City city) => companies = ObservableFuture(
          CompanyProvider.companiesByCity(city: city.slug, page: 1)
              .then((CompaniesResult result) {
        totalCompanies = result.companies;
        page = result.page;
        totalPage = result.totalPage;
        return result.companies;
      }));

  @action
  Future getMoreCompanies(city, page) {}
}

class CompaniesResult {
  final int page;
  final int totalPage;
  final List<Company> companies;

  CompaniesResult({this.page, this.totalPage, this.companies});
}

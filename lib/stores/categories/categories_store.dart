import 'package:mobx/mobx.dart';
import 'package:vitrine237/models/category.dart';
import 'package:vitrine237/models/company.dart';
import 'package:vitrine237/models/company_response.dart';
import 'package:vitrine237/models/sub_sector.dart';
import 'package:vitrine237/providers/categories_provider.dart';
//import 'package:vitrine237/stores/cities/city_store.dart';

part 'categories_store.g.dart';

class CategoriesStore = _CategoriesStore with _$CategoriesStore;

abstract class _CategoriesStore with Store {
  @observable
  ObservableFuture<List<Category>> categories;

  @observable
  ObservableFuture<CompanyResponse> companies;

  @observable
  ObservableFuture<List<Company>> subsectorCompanies;

  @action
  Future getCategories() => categories = ObservableFuture(
      CategoriesProvider.index().then((List<Category> result) => result));

  @action
  Future getCompanies(Category state) =>
      companies = ObservableFuture(CategoriesProvider.companies(state.slug)
          .then((CompanyResponse result) => result));

  @action
  Future getCompaniesBySector(SubSector state) => subsectorCompanies =
          ObservableFuture(CategoriesProvider.companiesBySector(state.slug)
              .then((List<Company> result) {
        return result;
      }));
}

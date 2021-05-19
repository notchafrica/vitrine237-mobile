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
  List<Company> totalList = [];

  @observable
  ObservableFuture<CompanyResponse> subsectorCompanies;

  @observable
  bool loadingMore = false;

  @action
  Future getCategories() => categories = ObservableFuture(
      CategoriesProvider.index().then((List<Category> result) => result));

  /* @action
  Future getCompanies(Category state) =>
      companies = ObservableFuture(CategoriesProvider.companies(state.slug)
          .then((CompanyResponse result) => result)); */

  @action
  Future getCompanies(Category state) {
    return companies =
        ObservableFuture(CategoriesProvider.companies(state.slug).then((value) {
      totalList.addAll(value.companies);
      return value;
    }));
  }

  @action
  Future getCompaniesBySector(SubSector state) =>
      subsectorCompanies = ObservableFuture(
          CategoriesProvider.companiesBySector(state.slug).then((result) {
        return result;
      }));

  @action
  getMoreCompaniesBySector(SubSector state) {
    if (subsectorCompanies.result.current_page <
            subsectorCompanies.result.total_page &&
        !loadingMore) {
      loadingMore = true;
      CategoriesProvider.companiesBySector(state.slug,
              page: subsectorCompanies.result.current_page + 1)
          .then((CompanyResponse value) {
        if (value.companies.length > 0) {
          subsectorCompanies.result.total_page = value.total_page;
          subsectorCompanies.result.current_page = value.current_page;
          subsectorCompanies.result.companies.addAll(value.companies);
          loadingMore = false;
        } else {
          loadingMore = false;
        }
      });
    }
  }

  @action
  List<Company> getMoreCompanies(Category state) {
    if (companies.result.current_page < companies.result.total_page &&
        !loadingMore) {
      loadingMore = true;

      CategoriesProvider.companies(state.slug,
              page: companies.result.current_page + 1)
          .then((CompanyResponse value) {
        if (value.companies.length > 0) {
          companies.result.total_page = value.total_page;
          companies.result.current_page = value.current_page;
          totalList.addAll(value.companies);
          loadingMore = false;
        } else {
          loadingMore = false;
        }

        print(value.companies.length);
        print(totalList.length);

        return value.companies;
      });
    }

    return [];
  }
}

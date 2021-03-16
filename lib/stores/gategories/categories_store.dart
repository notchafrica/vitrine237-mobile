import 'package:mobx/mobx.dart';
import 'package:vitrine237/models/category.dart';
import 'package:vitrine237/providers/categories_provider.dart';

part 'categories_store.g.dart';

class CategoriesStore = _CategoriesStore with _$CategoriesStore;

abstract class _CategoriesStore with Store {
  @observable
  ObservableFuture<List<Category>> categories;

  @action
  Future getCategories() => categories = ObservableFuture(
      CategoriesProvider.index().then((List<Category> result) => result));
}

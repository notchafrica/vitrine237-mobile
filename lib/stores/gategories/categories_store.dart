import 'package:mobx/mobx.dart';
import 'package:vitrine237/models/category.dart';
import 'package:vitrine237/providers/categories_provider.dart';

part 'categories_store.g.dart';

class CategoriesStore = _CategoriesStore with _$CategoriesStore;

abstract class _CategoriesStore with Store {
  @observable
  List<Category> categories;

  @action
  Future getCategories() async {
    categories = await CategoriesProvider.index();
  }
}

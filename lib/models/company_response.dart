import 'package:vitrine237/models/category.dart';
import 'package:vitrine237/models/company.dart';

class CompanyResponse {
  Category category;
  List<Company> companies;
  int total_page;
  int current_page;

  CompanyResponse(
      {this.category,
      this.companies,
      this.total_page = 1,
      this.current_page = 1});
}

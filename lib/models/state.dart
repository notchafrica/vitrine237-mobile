import 'package:vitrine237/models/city.dart';
import 'package:vitrine237/models/company.dart';

class State {
  final String name;
  final String code;
  final int companyNumber;
  final List<City> cities;

  State({this.name, this.code, this.companyNumber, this.cities});
}

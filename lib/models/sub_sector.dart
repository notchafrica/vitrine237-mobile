import 'package:vitrine237/models/category.dart';

class SubSector {
  int id;
  String name;
  String slug;
  String companiesNumber;
  Category sector;

  SubSector({
    this.id,
    this.name,
    this.slug,
    this.sector,
    this.companiesNumber,
  });
}

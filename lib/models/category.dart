import 'package:vitrine237/models/sub_sector.dart';

class Category {
  int id;
  String name;
  String slug;
  List<SubSector> subSectors = [];

  Category({this.id, this.name, this.slug, this.subSectors});
}

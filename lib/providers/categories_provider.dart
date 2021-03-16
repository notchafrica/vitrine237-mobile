import 'dart:convert';

import 'package:vitrine237/models/category.dart';
import 'package:vitrine237/models/sub_sector.dart';
import 'package:vitrine237/services/api.dart';

class CategoriesProvider {
  static Future<List<Category>> index() async {
    var r = await API.get('/categories');
    var rParsed = jsonDecode(r.body);
    return rParsed['data']
        .map<Category>((category) => Category(
            id: category['id'],
            name: category['name'],
            slug: category['slug'],
            subSectors: category['sub_sectors'] == null
                ? []
                : category['sub_sectors']
                    .map<SubSector>((product) => SubSector(
                          name: product['name'],
                          id: product['id'],
                          slug: product['slug'],
                          sector: null,
                        ))
                    .toList()))
        .toList();
  }
}

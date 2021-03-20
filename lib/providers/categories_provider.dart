import 'dart:convert';

import 'package:vitrine237/models/category.dart';
import 'package:vitrine237/models/city.dart';
import 'package:vitrine237/models/company.dart';
import 'package:vitrine237/models/post.dart';
import 'package:vitrine237/models/sub_sector.dart';
import 'package:vitrine237/services/api.dart';

class CategoriesProvider {
  static Future<List<Category>> index() async {
    var r = await API.get('/categories');
    var rParsed = jsonDecode(r.body);
    return rParsed
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
                        companiesNumber:
                            product['companies_number'].toString()))
                    .toList()))
        .toList();
  }

  static Future<List<Company>> companies(slug) async {
    var r = await API.get('/categories/' + slug + '/companies');
    var rParsed = jsonDecode(r.body);
    return rParsed
        .map<Company>((company) => Company(
            name: company['name'],
            slug: company['slug'],
            about: company['about'],
            poster: company['poster'],
            backdrop: company['backdrop'],
            phone: company['phone'],
            city: City(
                name: company['city']['name'], slug: company['city']['slug']),
            phone2: company['phone2'],
            email: company['email'],
            website: company['website'],
            instagramUrl: company['instagram_url'],
            facebookUrl: company['facebook_url'],
            landmark: company['landmark'],
            lat: company['lat'],
            lng: company['lng'],
            zipCode: company['zip_code'],
            town: company['town'],
            twitterUrl: company['twitter_url'],
            sponsorships: company['sponsorships'] == null
                ? []
                : company['sponsorships']
                    .map<Company>((partner) => Company(name: 'hhhh'))
                    .toList(),
            subSector: SubSector(
                name: company['sub_sector']['name'],
                slug: company['sub_sector']['slug'],
                sector: Category(
                    name: company['sub_sector']['sector']['name'],
                    slug: company['sub_sector']['sector']['slug'])),
            posts: company['posts'] == null
                ? []
                : company['posts']
                    .map<Post>((product) => Post(
                        title: product['title'],
                        slug: product['slug'],
                        poster: product['poster'],
                        content: product['content']))
                    .toList()))
        .toList();
  }

  static Future<List<Company>> companiesBySector(slug) async {
    var r = await API.get('/sub-sectors/' + slug);
    var rParsed = jsonDecode(r.body);

    return rParsed['companies']
        .map<Company>((company) => Company(
            name: company['name'],
            slug: company['slug'],
            about: company['about'],
            poster: company['poster'],
            backdrop: company['backdrop'],
            phone: company['phone'],
            city: City(
                name: company['city']['name'], slug: company['city']['slug']),
            phone2: company['phone2'],
            email: company['email'],
            website: company['website'],
            instagramUrl: company['instagram_url'],
            facebookUrl: company['facebook_url'],
            landmark: company['landmark'],
            lat: company['lat'],
            lng: company['lng'],
            zipCode: company['zip_code'],
            town: company['town'],
            twitterUrl: company['twitter_url'],
            sponsorships: company['sponsorships'] == null
                ? []
                : company['sponsorships']
                    .map<Company>((partner) => Company(name: 'hhhh'))
                    .toList(),
            subSector: SubSector(
                name: company['sub_sector']['name'],
                slug: company['sub_sector']['slug'],
                sector: Category(
                    name: company['sub_sector']['sector']['name'],
                    slug: company['sub_sector']['sector']['slug'])),
            posts: company['posts'] == null
                ? []
                : company['posts']
                    .map<Post>((product) => Post(
                        title: product['title'],
                        slug: product['slug'],
                        poster: product['poster'],
                        content: product['content']))
                    .toList()))
        .toList();
  }
}

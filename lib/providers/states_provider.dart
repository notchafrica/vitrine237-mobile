import 'dart:convert';

import 'package:vitrine237/models/category.dart';
import 'package:vitrine237/models/city.dart';
import 'package:vitrine237/models/company.dart';
import 'package:vitrine237/models/post.dart';
import 'package:vitrine237/models/state.dart';
import 'package:vitrine237/models/sub_sector.dart';
import 'package:vitrine237/services/api.dart';

class StatesProvider {
  static Future<List<State>> index() async {
    var r = await API.get('/states');
    var rParsed = jsonDecode(r.body);
    return rParsed
        .map<State>((state) => State(
            name: state['name'],
            code: state['code'],
            cities: state['cities']
                .map<City>((city) => City(
                    name: city['name'],
                    slug: city["slug"],
                    companiesNumber: city['companies_number'].toString()))
                .toList(),
            companyNumber: state["companies_number"]))
        .toList();
  }

  static Future<List<Company>> companies(code) async {
    var r = await API.get('/states/' + code + '/companies');
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
                    .map<Company>((partner) => Company(name: partner()))
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
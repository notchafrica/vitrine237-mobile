import 'dart:convert';

import 'package:vitrine237/models/category.dart';
import 'package:vitrine237/models/city.dart';
import 'package:vitrine237/models/company.dart';
import 'package:vitrine237/models/post.dart';
import 'package:vitrine237/models/sub_sector.dart';
import 'package:vitrine237/services/api.dart';
import 'package:vitrine237/stores/search_store.dart';

class SearchProvider {
  static Future<SearchResult> search({String code, String city}) async {
    var r = await API.get('/search?q=' + code+'&city='+city);
    var rParsed = jsonDecode(r.body);

    r = SearchResult(
        companies: rParsed['companies']
            .map<Company>((company) => Company(
                name: company['name'],
                slug: company['slug'],
                about: company['about'],
                poster: company['poster'],
                backdrop: company['backdrop'],
                phone: company['phone'],
                city: City(
                    name: company['city']['name'],
                    slug: company['city']['slug']),
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
                        .map<Company>((partner) => Company(
                              name: partner['name'],
                              slug: partner['slug'],
                              about: partner['about'],
                              poster: partner['poster'],
                              backdrop: partner['backdrop'],
                              phone: partner['phone'],
                              city: City(
                                  name: partner['city']['name'],
                                  slug: partner['city']['slug']),
                              phone2: partner['phone2'],
                              email: partner['email'],
                              website: partner['website'],
                              instagramUrl: partner['instagram_url'],
                              facebookUrl: partner['facebook_url'],
                              landmark: partner['landmark'],
                              lat: partner['lat'],
                              lng: partner['lng'],
                              zipCode: partner['zip_code'],
                              town: partner['town'],
                              twitterUrl: partner['twitter_url'],
                              subSector: SubSector(
                                  name: partner['sub_sector']['name'],
                                  slug: partner['sub_sector']['slug'],
                                  sector: Category(
                                      name: partner['sub_sector']['sector']
                                          ['name'],
                                      slug: partner['sub_sector']['sector']
                                          ['slug'])),
                            ))
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
            .toList(),
        sectors: []);
    return r;
  }
}

import 'package:vitrine237/models/sub_sector.dart';

import 'city.dart';
import 'post.dart';

class Company {
  int id;
  String name;
  String slug;
  String about;
  String activeSubscrption;
  String backdrop;
  City city;
  String email;
  String facebookUrl;
  String instagramUrl;
  String landmark;
  String lat;
  String lng;
  String phone;
  String phone2;
  String poster;
  List<Post> posts = [];
  String town;
  List<Company> sponsorships = [];
  SubSector subSector;
  String twitterUrl;
  String website;
  String youtubeUrl;
  String zipCode;

  Company(
      {this.id,
      this.name,
      this.slug,
      this.about,
      this.activeSubscrption,
      this.backdrop,
      this.city,
      this.email,
      this.facebookUrl,
      this.instagramUrl,
      this.landmark,
      this.lat,
      this.lng,
      this.phone,
      this.phone2,
      this.poster,
      this.posts,
      this.sponsorships,
      this.subSector,
      this.town,
      this.twitterUrl,
      this.website,
      this.youtubeUrl,
      this.zipCode});
}

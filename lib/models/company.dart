import 'package:vitrine237/models/sub_sector.dart';

import 'city.dart';
import 'post.dart';

class Company {
  final int id;
  final String name;
  final String slug;
  final String about;
  final String activeSubscrption;
  final String backdrop;
  final City city;
  final String email;
  final String facebookUrl;
  final String instagramUrl;
  final String landmark;
  final String lat;
  final String lng;
  final String phone;
  final String phone2;
  final String poster;
  List<Post> posts = [];
  final String town;
  List<Company> sponsorships = [];
  final SubSector subSector;
  final String twitterUrl;
  final String website;
  final String youtubeUrl;
  final String zipCode;

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
      this.town,
      this.subSector,
      this.twitterUrl,
      this.website,
      this.youtubeUrl,
      this.posts,
      this.sponsorships,
      this.zipCode});
}

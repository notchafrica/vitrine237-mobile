import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vitrine237/models/city.dart';
import 'package:vitrine237/stores/cities/city_store.dart';

class CityDetailsScreen extends StatefulWidget {
  final City city;

  const CityDetailsScreen({Key key, this.city}) : super(key: key);
  @override
  _CityDetailsScreenState createState() => _CityDetailsScreenState();
}

class _CityDetailsScreenState extends State<CityDetailsScreen> {
  CityStore _cityStore = CityStore();

  @override
  void initState() {
    super.initState();
    _cityStore.getCompanies(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.city.name),
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
          itemBuilder: (context, i) {},
          itemCount: 8,
        );
      }),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:vitrine237/models/company.dart';
import 'package:vitrine237/stores/companies/company_store.dart';
import 'package:vitrine237/stores/gategories/categories_store.dart';
import 'package:vitrine237/stores/states/states_store.dart';

import 'company_detals_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoriesStore _categoriesStore = CategoriesStore();
  CompanyStore _companyStore = CompanyStore();
  StatesStore _statesStore = StatesStore();

  @override
  void initState() {
    super.initState();
    _categoriesStore.getCategories();
    _companyStore.getTrending();
    _companyStore.getLatest();
    _statesStore.getStates();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Observer(builder: (_) {
            switch (_categoriesStore.categories.status) {
              case FutureStatus.pending:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case FutureStatus.fulfilled:
                return Container(
                  height: 120,
                  margin: EdgeInsets.only(top: 12, bottom: 12),
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(.3)),
                              child: Icon(
                                FontAwesomeIcons.box,
                                color: Theme.of(context).primaryColor,
                                size: 26,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              _categoriesStore.categories.result[i].name,
                              textAlign: TextAlign.center,
                              softWrap: true,
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: _categoriesStore.categories.result.length,
                  ),
                );

                break;
              default:
                return SizedBox();
            }
          }),
          ListTile(
            title: Text("Tendances actuelles"),
            subtitle: Text("Entreprises les plus vues du moment"),
          ),
          Observer(builder: (_) {
            switch (_companyStore.trending.status) {
              case FutureStatus.pending:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case FutureStatus.fulfilled:
                return Column(
                  children: _trendingCompanies(_companyStore.trending.result),
                );

                break;
              default:
                return SizedBox();
            }
          }),
          ListTile(
            title: Text("Régions"),
            subtitle: Text("Trouvez les entreprise par régions"),
          ),
          Observer(builder: (_) {
            switch (_statesStore.states.status) {
              case FutureStatus.pending:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case FutureStatus.fulfilled:
                return Container(
                  height: 150,
                  margin: EdgeInsets.only(top: 12, bottom: 12),
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return InkWell(
                        child: Container(
                          width: 140,
                          child: Column(
                            children: [
                              Container(
                                height: 90,
                                width: 120,
                                margin: EdgeInsets.only(bottom: 6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            "https://vitrine237.cm/assets/img/states/" +
                                                _statesStore
                                                    .states.result[i].code +
                                                ".jpg"))),
                              ),
                              Text(_statesStore.states.result[i].name),
                              SizedBox(height: 8),
                              Text(_statesStore.states.result[i].companyNumber
                                      .toString() +
                                  " Entreprises")
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: _statesStore.states.result.length,
                  ),
                );

                break;
              default:
                //todo: remove when network
                return SizedBox();
            }
          }),
          ListTile(
            title: Text("Dernières entreprises enregistrées"),
            subtitle: Text("Dernières entreprises enregistrées"),
          ),
          Observer(builder: (_) {
            switch (_companyStore.latest.status) {
              case FutureStatus.pending:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case FutureStatus.fulfilled:
                return Column(
                  children: _trendingCompanies(_companyStore.latest.result),
                );

                break;
              default:
                return SizedBox();
            }
          }),
        ],
      ),
    );
  }

  List<Widget> _trendingCompanies(List<Company> items) {
    List<Widget> companies = [];

    for (var company in items) {
      companies.add(ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CompanyDetailsScreen(
                        company: company,
                      ))),
          title: Text(
            company.name,
            overflow: TextOverflow.ellipsis,
          ),
          leading: Container(
              width: 60,
              height: 60,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: company.poster != null
                    ? company.poster
                    : "https://vitrine237.cm/assets/favicon-96x96.png",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(.3),
                borderRadius: BorderRadius.circular(5),
                //image: NetworkImage,
              )),
          subtitle: Text(
            company.subSector.name,
            overflow: TextOverflow.ellipsis,
          )));
    }

    return companies;
  }
}

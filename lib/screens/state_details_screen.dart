import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:vitrine237/models/company.dart';
import 'package:vitrine237/screens/city_details.dart';
import 'package:vitrine237/screens/company_detals_screen.dart';
import 'package:vitrine237/stores/states/states_store.dart';

class StateDetailsScreen extends StatefulWidget {
  final state;

  const StateDetailsScreen({Key key, this.state}) : super(key: key);
  @override
  _StateDetailsScreenState createState() => _StateDetailsScreenState();
}

class _StateDetailsScreenState extends State<StateDetailsScreen> {
  StatesStore _statesStore = StatesStore();

  @override
  void initState() {
    super.initState();
    _statesStore.getCompanies(widget.state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 400,
          flexibleSpace: AnimatedSwitcher(
            duration: Duration(milliseconds: 600),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        "https://vitrine237.cm/assets/img/states/" +
                            widget.state.code +
                            ".jpg"),
                    fit: BoxFit.cover),
              ),
              child: Container(
                  color: Colors.black.withOpacity(.5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            widget.state.name,
                            textAlign: TextAlign.center,
                            //overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 16),
                  child: Text('Villes'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 12, bottom: 12),
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CityDetailsScreen(
                                          city: widget.state.cities[i],
                                        ))),
                            child: Container(
                              margin: EdgeInsets.only(right: 18),
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 12),
                              child: Column(
                                children: [
                                  Text(
                                    widget.state.cities[i].name,
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  Text(
                                    widget.state.cities[i].companiesNumber
                                            .toString() +
                                        " entreprises",
                                    style: TextStyle(color: Colors.blueGrey),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(.3)),
                            ),
                          );
                        },
                        itemCount: widget.state.cities.length),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Observer(builder: (_) {
            switch (_statesStore.companies.status) {
              case FutureStatus.pending:
                return Center(
                  child: LinearProgressIndicator(),
                );
                break;
              case FutureStatus.fulfilled:
                return ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 250,
                      maxHeight: MediaQuery.of(context).size.height * 2.45),
                  child: Column(
                    children: _companies(_statesStore.companies.result),
                  ),
                  //height: MediaQuery.of(context).size.height - 250,
                );
                break;
              default:
                return SizedBox();
            }
          }),
        )
      ],
    ));
  }

  List<Widget> _companies(List<Company> items) {
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
                color: Theme.of(context).primaryColor.withOpacity(.3),
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

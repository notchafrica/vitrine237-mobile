import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:vitrine237/screens/company_details_screen.dart';
import 'package:vitrine237/screens/home_screen.dart';
import 'package:vitrine237/stores/search_store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vitrine237',
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.red,
          primaryColor: Color(0xffc1272d),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Color(0xffc1272d))),
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int currentScreenIndex = 0;
  void onTapped(index) {
    setState(() {
      currentScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vitrine237'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchScreen());
            },
          )
        ],
      ),
      body: HomeScreen(),
    );
  }
}

class SearchScreen extends SearchDelegate {
  SearchStore _searchStore = SearchStore();
  @override
  String get searchFieldLabel => "Activité, ville";
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: AppBarTheme(
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.white),
        textTheme: TextTheme(
          headline4: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          labelStyle: TextStyle(color: Colors.white, fontSize: 12)),
      hintColor: Colors.white,
      primaryTextTheme: Theme.of(context).primaryTextTheme.copyWith(
          subtitle1: TextStyle(color: Colors.white),
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white),
          headline4: TextStyle(color: Colors.white),
          headline5: TextStyle(color: Colors.white),
          subtitle2: TextStyle(color: Colors.white)),
    );
  }

  @override
  TextStyle get searchFieldStyle =>
      TextStyle(color: Colors.white, fontSize: 12);

  /* @override
  // TODO: implement searchFieldDecorationTheme
  InputDecorationTheme get searchFieldDecorationTheme {
    return InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white));
  } */

  @override
  Widget buildResults(BuildContext context) {
    return Observer(builder: (_) {
      switch (_searchStore.companies.status) {
        case FutureStatus.pending:
          return Center(
            child: LinearProgressIndicator(),
          );
          break;
        case FutureStatus.fulfilled:
          if (_searchStore.companies.result.length <= 0) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Aucun élement ne correspond à votre recherche"),
            ));
          }
          return ListView.builder(
            itemBuilder: (context, i) {
              return ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CompanyDetailsScreen(
                                company: _searchStore.companies.result[i],
                              ))),
                  title: Text(
                    _searchStore.companies.result[i].name,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: Container(
                      width: 60,
                      height: 60,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: _searchStore.companies.result[i].poster !=
                                null
                            ? _searchStore.companies.result[i].poster
                            : "https://vitrine237.cm/assets/favicon-96x96.png",
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(.3),
                        borderRadius: BorderRadius.circular(5),
                        //image: NetworkImage,
                      )),
                  subtitle: Text(
                    _searchStore.companies.result[i].subSector.name,
                    overflow: TextOverflow.ellipsis,
                  ));
            },
            itemCount: _searchStore.companies.result.companies.length,
          );

          break;
        case FutureStatus.rejected:
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
                "Oups! nous rencontons un problème avec votre recherche",
                textAlign: TextAlign.center),
          ));
          break;
        default:
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Entrez une expression à chercher",
                textAlign: TextAlign.center),
          ));
      }
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length >= 2) {
      _searchStore.dynamicSearch(query);
      return Observer(builder: (_) {
        switch (_searchStore.companies.status) {
          case FutureStatus.pending:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case FutureStatus.fulfilled:
            if (_searchStore.companies.result.length <= 0) {
              return Center(
                  child: Text("Aucun élement ne correspond à votre recherche"));
            }
            return ListView.builder(
              itemBuilder: (context, i) {
                return ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CompanyDetailsScreen(
                                  company: _searchStore.companies.result[i],
                                ))),
                    title: Text(
                      _searchStore.companies.result[i].name,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: Container(
                        width: 60,
                        height: 60,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: _searchStore.companies.result[i].poster !=
                                  null
                              ? _searchStore.companies.result[i].poster
                              : "https://vitrine237.cm/assets/favicon-96x96.png",
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(.3),
                          borderRadius: BorderRadius.circular(5),
                          //image: NetworkImage,
                        )),
                    subtitle: Text(
                      _searchStore.companies.result[i].subSector.name,
                      overflow: TextOverflow.ellipsis,
                    ));
              },
              itemCount: _searchStore.companies.result.length,
            );

            break;
          case FutureStatus.rejected:
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  "Oups! nous rencontons un problème avec votre recherche",
                  textAlign: TextAlign.center),
            ));
            break;
          default:
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Entrez une expression à chercher",
                  textAlign: TextAlign.center),
            ));
        }
      });
    }
    return Container();
  }
}

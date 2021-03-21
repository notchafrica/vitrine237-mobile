import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:vitrine237/screens/company_detals_screen.dart';
import 'package:vitrine237/screens/home_screen.dart';
import 'package:vitrine237/stores/search_store.dart';

import 'services/screen_manager.dart';

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
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(elevation: 0, centerTitle: true)),
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
          /* actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: SearchScreen());
              },
            )
          ], */
        ),
        body: HomeScreen());
  }
}

class SearchScreen extends SearchDelegate {
  SearchStore _searchStore = SearchStore();
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
  Widget buildResults(BuildContext context) {
    if (query.length < 2) {
      return Container();
    }
    return Observer(builder: (_) {
      switch (_searchStore.results.status) {
        case FutureStatus.pending:
          return Center(
            child: LinearProgressIndicator(),
          );
          break;
        case FutureStatus.fulfilled:
          print("full");
          return ListView.builder(
            itemBuilder: (context, i) {
              return ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CompanyDetailsScreen(
                                company:
                                    _searchStore.results.result.companies[i],
                              ))),
                  title: Text(
                    _searchStore.results.result.companies[i].name,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: Container(
                      width: 60,
                      height: 60,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: _searchStore
                                    .results.result.companies[i].poster !=
                                null
                            ? _searchStore.results.result.companies[i].poster
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
                    _searchStore.results.result.companies[i].subSector.name,
                    overflow: TextOverflow.ellipsis,
                  ));
            },
            itemCount: _searchStore.results.result.companies.length,
          );

          break;
        default:
          return SizedBox();
      }
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container();
  }
}

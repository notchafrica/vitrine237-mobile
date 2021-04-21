import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mobx/mobx.dart';
import 'package:vitrine237/models/city.dart';
import 'package:vitrine237/providers/search_provider.dart';
import 'package:vitrine237/screens/company_details_screen.dart';
import 'package:vitrine237/stores/cities/city_store.dart';
import 'package:vitrine237/stores/search_store.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchStore _searchStore = SearchStore();
  TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _typeAheadController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //search form
            Container(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      BackButton(
                        color: Colors.white,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 56,
                        child: RoundedInputField(
                          hintText: "Que recherchez vous?",
                          type: TextInputType.emailAddress,
                          //icon: Ionicons.ios_mail,
                          onChanged: (value) async {
                            _searchStore.getSearch(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 8,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: TextFieldContainer(
                        child: TypeAheadFormField(
                          textFieldConfiguration: TextFieldConfiguration(
                              controller: _typeAheadController,
                              autofocus: false,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: "Ville",
                                  labelText: "Ville",
                                  labelStyle: TextStyle(color: Colors.white),
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.white))),
                          suggestionsCallback: (pattern) async {
                            return await SearchProvider.findCity(pattern);
                          },
                          itemBuilder:
                              (context, Map<String, String> suggestion) {
                            return ListTile(
                              title: Text(suggestion['name'].toString()),
                            );
                          },
                          transitionBuilder:
                              (context, suggestionsBox, controller) {
                            return suggestionsBox;
                          },
                          onSuggestionSelected:
                              (Map<String, String> suggestion) {
                            _searchStore.setCity(suggestion['slug']);
                            _typeAheadController.text = suggestion["name"];
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Veuillez selectionner un ville';
                            }

                            return null;
                          },
                          onSaved: (value) => _searchStore.setCity,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            //listview
            Expanded(
              child: Container(
                  height: MediaQuery.of(context).size.height - 120,
                  child: Observer(builder: (_) {
                    print(_searchStore.companies.status);

                    return Text('sduiuisd');
                    switch (_searchStore.companies.status) {
                      case FutureStatus.pending:
                        return Center(
                          child: LinearProgressIndicator(),
                        );
                        break;
                      case FutureStatus.fulfilled:
                        return ListView.builder(
                          itemBuilder: (context, i) {
                            return ListTile(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CompanyDetailsScreen(
                                              company: _searchStore
                                                  .companies.result[i],
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
                                      imageUrl: _searchStore
                                                  .companies.result[i].poster !=
                                              null
                                          ? _searchStore
                                              .companies.result[i].poster
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
                                  _searchStore
                                      .companies.result[i].subSector.name,
                                  overflow: TextOverflow.ellipsis,
                                ));
                          },
                          itemCount: _searchStore.companies.result.length,
                        );
                        break;
                      default:
                        return Center(
                            child: Text("Entrez une expression à chercher"));
                    }
                  })),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType type;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.type = TextInputType.text,
    this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        //cursorColor: Theme.of(context).primaryColor,
        style: TextStyle(color: Colors.white),
        keyboardType: type,
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: hintText,
            labelStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.2),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}

class BackendService {
  static Future<List<Map<String, String>>> getSuggestions(String query) async {
    await Future.delayed(Duration(seconds: 1));

    return List.generate(10, (index) {
      return {
        'name': query + index.toString(),
        'price': Random().nextInt(100).toString()
      };
    });
  }
}

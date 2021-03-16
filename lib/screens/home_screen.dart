import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:vitrine237/stores/gategories/categories_store.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoriesStore _categoriesStore = CategoriesStore();

  @override
  void initState() {
    super.initState();
    _categoriesStore.getCategories();
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
                        width: 160,
                        child: Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
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
                              overflow: TextOverflow.ellipsis,
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
          })
        ],
      ),
    );
  }
}

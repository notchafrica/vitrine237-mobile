import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:vitrine237/models/category.dart';
import 'package:vitrine237/models/company.dart';
import 'package:vitrine237/screens/company_details_screen.dart';
import 'package:vitrine237/screens/subsector_details_screen.dart';
import 'package:vitrine237/stores/categories/categories_store.dart';

class CategoryDetailsScreen extends StatefulWidget {
  final Category category;

  const CategoryDetailsScreen({Key key, this.category}) : super(key: key);
  @override
  _CategoryDetailsScreenState createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  CategoriesStore _categoryStore = CategoriesStore();
  @override
  void initState() {
    super.initState();
    _categoryStore.getCompanies(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 16),
                child: Text('Sous secteurs'),
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
                                  builder: (context) => SubsectorDetailsScreen(
                                      subsector:
                                          widget.category.subSectors[i]))),
                          child: Container(
                            margin: EdgeInsets.only(right: 18),
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 12),
                            child: Column(
                              children: [
                                Text(
                                  widget.category.subSectors[i].name,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                                Text(
                                  widget.category.subSectors[i].companiesNumber
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
                      itemCount: widget.category.subSectors.length),
                ),
              ),
              Observer(builder: (_) {
                switch (_categoryStore.companies.status) {
                  case FutureStatus.pending:
                    return Center(
                      child: LinearProgressIndicator(),
                    );
                    break;
                  case FutureStatus.fulfilled:
                    return Column(
                      children: _companies(_categoryStore.companies.result),
                    );

                    break;
                  default:
                    return SizedBox();
                }
              }),
            ],
          ),
        ),
      ),
    );
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

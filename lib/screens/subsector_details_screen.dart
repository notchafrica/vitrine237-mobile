import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:vitrine237/models/sub_sector.dart';
import 'package:vitrine237/screens/company_details_screen.dart';
import 'package:vitrine237/stores/categories/categories_store.dart';

class SubsectorDetailsScreen extends StatefulWidget {
  final SubSector subsector;

  const SubsectorDetailsScreen({Key key, this.subsector}) : super(key: key);
  @override
  _SubsectorDetailsScreenState createState() => _SubsectorDetailsScreenState();
}

class _SubsectorDetailsScreenState extends State<SubsectorDetailsScreen> {
  CategoriesStore _categoriesStore = CategoriesStore();
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 0.0, keepScrollOffset: true);

  @override
  void initState() {
    super.initState();
    _categoriesStore.getCompaniesBySector(widget.subsector);

    _scrollController.addListener(() {
      var isEnd = _scrollController.offset ==
          _scrollController.position.maxScrollExtent;

      if (isEnd) {
        _categoriesStore.getMoreCompaniesBySector(widget.subsector);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.subsector.name)),
      body: Observer(builder: (_) {
        switch (_categoriesStore.subsectorCompanies.status) {
          case FutureStatus.pending:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case FutureStatus.fulfilled:
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 90,
                    child: ListView.builder(
                        controller: _scrollController,
                        itemCount: _categoriesStore
                            .subsectorCompanies.result.companies.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CompanyDetailsScreen(
                                            company: _categoriesStore
                                                .subsectorCompanies
                                                .result
                                                .companies[i],
                                          ))),
                              title: Text(
                                _categoriesStore.subsectorCompanies.result
                                    .companies[i].name,
                                overflow: TextOverflow.ellipsis,
                              ),
                              leading: Container(
                                  width: 60,
                                  height: 60,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: _categoriesStore
                                                .subsectorCompanies
                                                .result
                                                .companies[i]
                                                .poster !=
                                            null
                                        ? _categoriesStore.subsectorCompanies
                                            .result.companies[i].poster
                                        : "https://vitrine237.cm/assets/favicon-96x96.png",
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(.3),
                                    borderRadius: BorderRadius.circular(5),
                                    //image: NetworkImage,
                                  )),
                              subtitle: Text(
                                _categoriesStore.subsectorCompanies.result
                                    .companies[i].subSector.name,
                                overflow: TextOverflow.ellipsis,
                              ));
                        }),
                  ),
                  !_categoriesStore.loadingMore
                      ? SizedBox(
                          height: 10,
                        )
                      : LinearProgressIndicator()
                ],
              ),
            );

            break;
          default:
            return SizedBox();
        }
      }),
    );
  }
}

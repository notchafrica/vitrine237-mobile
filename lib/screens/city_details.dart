import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:vitrine237/bloc/company_bloc.dart';
import 'package:vitrine237/models/city.dart';
import 'package:vitrine237/stores/cities/city_store.dart';

import 'company_details_screen.dart';

class CityDetailsScreen extends StatefulWidget {
  final City city;

  const CityDetailsScreen({Key key, this.city}) : super(key: key);
  @override
  _CityDetailsScreenState createState() => _CityDetailsScreenState();
}

class _CityDetailsScreenState extends State<CityDetailsScreen> {
  CityStore _cityStore = CityStore();

  ScrollController _scrollController = new ScrollController();
  var _disposer;

  @override
  void initState() {
    super.initState();
    _cityStore.getCompanies(widget.city);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _disposer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.city.name),
      ),
      /* body: BlocProvider(
        create: (_) =>
            CompanyBloc(httpClient: http.Client())..add(PostFetched()),
        child: PostsList(),
      ), */
      // body: Observer(builder: (_) {
      //   switch (_cityStore.companies.status) {
      //     case FutureStatus.pending:
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //       break;
      //     case FutureStatus.fulfilled:
      //       return ListView.builder(
      //         itemBuilder: (context, index) {
      //           return ListTile(
      //               onTap: () => Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => CompanyDetailsScreen(
      //                             company: _cityStore.companies.result[index],
      //                           ))),
      //               title: Text(
      //                 _cityStore.companies.result[index].name,
      //                 overflow: TextOverflow.ellipsis,
      //               ),
      //               leading: Container(
      //                   width: 60,
      //                   height: 60,
      //                   child: CachedNetworkImage(
      //                     fit: BoxFit.cover,
      //                     imageUrl: _cityStore.companies.result[index].poster !=
      //                             null
      //                         ? _cityStore.companies.result[index].poster
      //                         : "https://vitrine237.cm/assets/favicon-96x96.png",
      //                     placeholder: (context, url) =>
      //                         CircularProgressIndicator(),
      //                     errorWidget: (context, url, error) =>
      //                         Icon(Icons.error),
      //                   ),
      //                   decoration: BoxDecoration(
      //                     color: Theme.of(context).primaryColor.withOpacity(.3),
      //                     borderRadius: BorderRadius.circular(5),
      //                   )),
      //               subtitle: Text(
      //                 _cityStore.companies.result[index].subSector.name,
      //                 overflow: TextOverflow.ellipsis,
      //               ));
      //         },
      //         itemCount: _cityStore.companies.result.length,
      //       );

      //       break;
      //     default:
      //       return SizedBox();
      //   }
      // }),
    );
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vitrine237/models/company.dart';

class CompanyDetailsScreen extends StatefulWidget {
  final Company company;

  const CompanyDetailsScreen({Key key, this.company}) : super(key: key);
  @override
  _CompanyDetailsScreenState createState() => _CompanyDetailsScreenState();
}

class _CompanyDetailsScreenState extends State<CompanyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.company.name),
        actions: [
          IconButton(
              icon: Icon(Icons.mail),
              onPressed: () async {
                launch(emailLauncher(widget.company.email).toString());
              }),
          IconButton(
              icon: Icon(Icons.phone),
              onPressed: () {
                launch("tel:" + widget.company.phone);
              }),
          IconButton(
              icon: Icon(FontAwesome5Brands.whatsapp),
              onPressed: () {
                launch("whatsapp:" + widget.company.phone);
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          "https://vitrine237.cm/assets/img/listings-details.jpg")),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(4))),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          width: 80,
                          height: 80,
                          margin: EdgeInsets.only(bottom: 6),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: widget.company.poster != null
                                ? widget.company.poster
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.box,
                            color: Colors.white,
                            size: 14,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            widget.company.subSector.sector.name,
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          widget.company.name,
                          textAlign: TextAlign.center,
                          //overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 6),
                        child: Text(
                          widget.company.subSector.name,
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.5),
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(4))),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      labelStyle: TextStyle(
                          //up to your taste
                          fontWeight: FontWeight.w700),
                      indicatorSize:
                          TabBarIndicatorSize.label, //makes it better
                      labelColor:
                          Theme.of(context).primaryColor, //Google's sweet blue
                      unselectedLabelColor: Color(0xff5f6368), //niceish grey
                      isScrollable: true, //up to your taste
                      indicator: MD2Indicator(
                          //it begins here
                          indicatorHeight: 3,
                          indicatorColor: Theme.of(context).primaryColor,
                          indicatorSize: MD2IndicatorSize
                              .normal //3 different modes tiny-normal-full
                          ),
                      tabs: <Widget>[
                        Tab(
                          text: "Details",
                        ),
                        Tab(
                          text: "Posts",
                        ),
                        Tab(
                          text: "Nous Contacter",
                        ),
                      ],
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.expand(
                          height: MediaQuery.of(context).size.height),
                      child: TabBarView(children: [
                        Text(widget.company.about),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: _loadPosts(),
                          ),
                        ),
                        Text('fhfhfh'),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _loadPosts() {
    List<Widget> posts = [];

    for (var item in widget.company.posts) {
      posts.add(Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              title: Text(item.title, softWrap: true),
              leading: CircleAvatar(
                backgroundImage:
                    CachedNetworkImageProvider(widget.company.poster),
              ),
            ),
            SizedBox(height: 6),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(item.poster != null
                          ? item.poster
                          : "https://vitrine237.cm/assets/img/listings-details.jpg"))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(item.content, softWrap: true),
            )
          ],
        ),
      ));
    }

    return posts;
  }

  Uri emailLauncher(email) {
    return Uri(
        scheme: 'mailto',
        path: email,
        queryParameters: {'subject': 'Hello from Vitrine237 APP'});
  }
}

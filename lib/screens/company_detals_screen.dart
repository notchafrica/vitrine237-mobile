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

class _CompanyDetailsScreenState extends State<CompanyDetailsScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            bottom: PreferredSize(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
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
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(5)),
                    )
                  ],
                ),
              ),
              preferredSize: Size(double.infinity, 300),
            ),
            flexibleSpace: AnimatedSwitcher(
              duration: Duration(milliseconds: 600),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          "https://vitrine237.cm/assets/img/listings-details.jpg"),
                      fit: BoxFit.cover),
                ),
                child: Container(
                    color: Colors.black.withOpacity(.5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: []),
                    )),
              ),
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.mail),
                  tooltip: "Envoyer un email",
                  onPressed: () async {
                    final String url =
                        emailLauncher(widget.company.email).toString();
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  }),
              IconButton(
                  icon: Icon(Icons.phone),
                  tooltip: "Passer un appel",
                  onPressed: widget.company.phone == null
                      ? null
                      : () async {
                          final String url = "tel:" + widget.company.phone;
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        }),
              IconButton(
                  icon: Icon(FontAwesome5Brands.whatsapp),
                  tooltip: "Lassez un message",
                  onPressed: widget.company.phone2 == null
                      ? null
                      : () async {
                          final String url =
                              "https://wa.me/" + widget.company.phone2;
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        }),
              IconButton(
                  icon: Icon(FontAwesome.globe),
                  tooltip: "Visiter le site web",
                  onPressed: widget.company.website == null
                      ? null
                      : () async {
                          final String url = widget.company.website;
                          if (await canLaunch(url)) {
                            await launch(url, forceWebView: true);
                          } else {
                            throw 'Could not launch $url';
                          }
                        }),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width,
              child: TabBar(
                controller: _tabController,
                labelStyle: TextStyle(
                    //up to your taste
                    fontWeight: FontWeight.w700),
                indicatorSize: TabBarIndicatorSize.label, //makes it better
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
                    text: "A propos",
                  ),
                  Tab(
                    text: "Posts",
                  ),
                  Tab(
                    text: "Partenaires",
                  ),
                  Tab(text: "Details")
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 250,
              child: TabBarView(controller: _tabController, children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  height: MediaQuery.of(context).size.height - 440,
                  child:
                      SingleChildScrollView(child: Text(widget.company.about)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 440,
                  child: SingleChildScrollView(
                    child: Column(
                      children: _loadPosts(),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 440,
                  child: SingleChildScrollView(
                    child: Column(
                      children: _loadPartners(),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 440,
                  child: SingleChildScrollView(
                      child: Card(
                          child: Column(children: [
                    ListTile(
                      leading: Icon(FontAwesome.map_marker),
                      title: Text(widget.company.city.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.company.town.toString()),
                          Text(widget.company.landmark.toString().toLowerCase())
                        ],
                      ),
                    ),
                    ListTile(
                        leading: Icon(Icons.email),
                        title: Text(widget.company.email == null
                            ? ""
                            : widget.company.email)),
                    ListTile(
                        leading: Icon(Icons.phone),
                        title: Text(widget.company.phone == null
                            ? ""
                            : widget.company.phone)),
                    ListTile(
                        leading: Icon(FontAwesome5Brands.whatsapp),
                        title: Text(widget.company.phone2 == null
                            ? ""
                            : widget.company.phone2)),
                    ListTile(
                        leading: Icon(FontAwesome5Brands.twitter),
                        title: Text(widget.company.twitterUrl == null
                            ? ""
                            : widget.company.twitterUrl)),
                    ListTile(
                        leading: Icon(FontAwesome5Brands.facebook),
                        title: Text(widget.company.facebookUrl == null
                            ? ""
                            : widget.company.facebookUrl)),
                    ListTile(
                        leading: Icon(FontAwesome5Brands.youtube),
                        title: Text(widget.company.youtubeUrl == null
                            ? ""
                            : widget.company.youtubeUrl)),
                    ListTile(
                        leading: Icon(FontAwesome.globe),
                        title: Text(widget.company.website == null
                            ? ""
                            : widget.company.website))
                  ]))),
                ),
              ]),
            ),
          )
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.mail),
              tooltip: "Envoyer un email",
              onPressed: () async {
                final String url =
                    emailLauncher(widget.company.email).toString();
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              }),
          IconButton(
              icon: Icon(Icons.phone),
              tooltip: "Passer un appel",
              onPressed: widget.company.phone == null
                  ? null
                  : () async {
                      final String url = "tel:" + widget.company.phone;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }),
          IconButton(
              icon: Icon(FontAwesome5Brands.whatsapp),
              tooltip: "Lassez un message",
              onPressed: widget.company.phone2 == null
                  ? null
                  : () async {
                      final String url =
                          "https://wa.me/" + widget.company.phone2;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }),
          IconButton(
              icon: Icon(FontAwesome.globe),
              tooltip: "Visiter le site web",
              onPressed: widget.company.website == null
                  ? null
                  : () async {
                      final String url = widget.company.website;
                      if (await canLaunch(url)) {
                        await launch(url, forceWebView: true);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          "https://vitrine237.cm/assets/img/listings-details.jpg")),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(6))),
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
                length: 4,
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
                          text: "A propos",
                        ),
                        Tab(
                          text: "Posts",
                        ),
                        Tab(
                          text: "Partenaires",
                        ),
                        Tab(text: "Details")
                      ],
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height),
                      child: TabBarView(children: [
                        Card(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.company.about),
                        )),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: _loadPosts(),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: _loadPartners(),
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Card(
                                    child: Column(children: [
                                  ListTile(
                                    leading: Icon(FontAwesome.map_marker),
                                    title: Text(widget.company.city.name),
                                    subtitle: Column(
                                      children: [
                                        Text(widget.company.town.toString()),
                                        Text(widget.company.landmark
                                            .toString()
                                            .toLowerCase())
                                      ],
                                    ),
                                  ),
                                  ListTile(
                                      leading: Icon(Icons.email),
                                      title: Text(widget.company.email == null
                                          ? ""
                                          : widget.company.email)),
                                  ListTile(
                                      leading: Icon(Icons.phone),
                                      title: Text(widget.company.phone == null
                                          ? ""
                                          : widget.company.phone)),
                                  ListTile(
                                      leading:
                                          Icon(FontAwesome5Brands.whatsapp),
                                      title: Text(widget.company.phone2 == null
                                          ? ""
                                          : widget.company.phone2)),
                                  ListTile(
                                      leading: Icon(FontAwesome5Brands.twitter),
                                      title: Text(
                                          widget.company.twitterUrl == null
                                              ? ""
                                              : widget.company.twitterUrl)),
                                  ListTile(
                                      leading:
                                          Icon(FontAwesome5Brands.facebook),
                                      title: Text(
                                          widget.company.facebookUrl == null
                                              ? ""
                                              : widget.company.facebookUrl)),
                                  ListTile(
                                      leading: Icon(FontAwesome5Brands.youtube),
                                      title: Text(
                                          widget.company.youtubeUrl == null
                                              ? ""
                                              : widget.company.youtubeUrl)),
                                  ListTile(
                                      leading: Icon(FontAwesome.globe),
                                      title: Text(widget.company.website == null
                                          ? ""
                                          : widget.company.website))
                                ]))
                              ],
                            ))
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

  List<Widget> _loadPartners() {
    List<Widget> posts = [];

    for (var company in widget.company.sponsorships) {
      posts.add(ListTile(
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

    return posts;
  }

  Uri emailLauncher(email) {
    return Uri(
        scheme: 'mailto',
        path: email,
        queryParameters: {'subject': 'Vitrine237'});
  }
}

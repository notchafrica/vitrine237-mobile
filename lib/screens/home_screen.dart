import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 120,
            margin: EdgeInsets.only(top: 12, bottom: 12),
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return Container(
                  width: 120,
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color:
                                Theme.of(context).primaryColor.withOpacity(.3)),
                        child: Icon(
                          FontAwesomeIcons.box,
                          color: Theme.of(context).primaryColor,
                          size: 26,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Text dsbksdb sdjkbsdk dskjsd',
                        textAlign: TextAlign.center,
                        //overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                );
              },
              itemCount: 20,
            ),
          )
        ],
      ),
    );
  }
}

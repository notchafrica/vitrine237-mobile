import 'package:flutter/material.dart';
import 'package:vitrine237/models/category.dart';

class CategoryDetails extends StatefulWidget {
  final Category category;

  const CategoryDetails({Key key, this.category}) : super(key: key);
  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

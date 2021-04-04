import 'package:flutter/material.dart';
import 'package:news_currency_converter_bloc/src/presentation/widgets/news_blogs.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: SizedBox(child: NewsBlogWidget()),
    );
  }
}

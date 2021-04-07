import 'package:flutter/material.dart';
import 'package:news_currency_converter_bloc/src/data/models/news_model/article.dart';

class NewsPage extends StatelessWidget {
  final Article article;

  @override
  const NewsPage({
    @required this.article,
  });

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Hero(
            tag: '${article.url}:${article.description}',
            child: Card(
              elevation: 10,
              borderOnForeground: true,
              shadowColor: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(50))),
              color: Theme.of(context).backgroundColor,
              child: ListTile(
                title: Image.network(article.urlToImage),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    article.description,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

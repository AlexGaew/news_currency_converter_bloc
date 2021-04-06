import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_currency_converter_bloc/src/buisnes_logic/cubit/news/top_headlines_cubit.dart';
import 'package:news_currency_converter_bloc/src/data/models/news_model/article.dart';
import 'package:news_currency_converter_bloc/src/presentation/widgets/test.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'favorites_button.dart';

class NewsBlogWidget extends StatelessWidget {
  final Article article;

  NewsBlogWidget({
    @required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, top: 6, left: 10, right: 10),
      child: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                child: Image.network(
                  article.urlToImage ??
                      'https://s2.best-wallpaper.net/wallpaper/'
                          '2560x1600/1212/Beautiful-nature-landscape-lake-mountains-'
                          'trees-village-blue-sky-white-clouds_2560x1600.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              ListTile(
                //tileColor: Theme.of(context).primaryColor.withOpacity(0.3),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
                title: Text(article.title,style: TextStyle(color: Theme.of(context).primaryColor,
                fontSize: 18),),
              ),
            ],
          ),
          Positioned(

            top: 15,
            right: 25,
            child: FavoriteButton(article: article,),
          ),
        ],
      ),

      //   ),
    );
  }
}

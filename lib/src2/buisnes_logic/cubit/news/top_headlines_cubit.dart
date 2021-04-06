import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news_currency_converter_bloc/src/data/models/news_model/article.dart';
import 'package:news_currency_converter_bloc/src/data/models/news_model/source.dart';
import 'package:news_currency_converter_bloc/src/data/repositories/news/async_news_repository.dart';
import 'package:news_currency_converter_bloc/src/data/repositories/news/news_repository.dart';

part 'top_headlines_state.dart';

class TopHeadlinesCubit extends Cubit<TopHeadlinesInitial> {
  NewsRepository _newsRepository = AsyncNewsRepository();

  TopHeadlinesCubit()
      : super(
          TopHeadlinesInitial(
            article: [
              Article(
                  source: {
                    '': Source(
                      id: '',
                      name: '',
                    )
                  },
                  author: 'author',
                  title: 'title',
                  description: 'description',
                  url: 'url',
                  urlToImage:
                      'https://s2.best-wallpaper.net/wallpaper/2560x1600/1212/Beautiful-nature-landscape-lake-mountains-trees-village-blue-sky-white-clouds_2560x1600.jpg',
                  publishedAt: 'publishedAt',
                  content: 'content')
            ],
          ),
        );

  void getTopHeadNews() async {
    List<Article> news = await _newsRepository.fetchTopHeadlinesNews();

    if (news != null) {
      print("News!!!!!!!!!!!!!!!!!!!");
      emit(TopHeadlinesInitial(article: news));
    }
  }
}

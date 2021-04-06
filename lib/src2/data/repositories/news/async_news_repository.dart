import 'package:news_currency_converter_bloc/src/data/data_providers/fetch_data.dart';
import 'package:news_currency_converter_bloc/src/data/data_providers/fetch_data_from_networks.dart';
import 'package:news_currency_converter_bloc/src/data/models/news_model/article.dart';
import 'package:news_currency_converter_bloc/src/data/repositories/news/news_repository.dart';

class AsyncNewsRepository extends NewsRepository {
  FetchData newsData = FetchDataFromNetworks();

  @override
  Future<List<Article>> fetchTopHeadlinesNews({country}) async {
    final listArticle = <Article>[];
    Article _article;

    final response = await newsData.getTopHeadlinesNews();
    var article = response['articles'] as Iterable<dynamic>;

    final dtos = article
        .cast<Map<String, dynamic>>()
        .map((json) => Article.fromJson(json));

    for(var dto in dtos){
      int i;
      listArticle.add(
          Article(
            url: dto.url,
            title: dto.title,
            author: dto.author,
            content: dto.content,
            description: dto.description,
            publishedAt: dto.publishedAt,
            source: dto.source,
            urlToImage: dto.urlToImage,
          ),
      );
    }

    // if (dtos.length > 0) {
    //   _article = Article(
    //     url: dtos.first.url,
    //     title: dtos.first.title,
    //     author: dtos.first.author,
    //     content: dtos.first.content,
    //     description: dtos.first.description,
    //     publishedAt: dtos.first.publishedAt,
    //     source: dtos.first.source,
    //     urlToImage: dtos.first.urlToImage,
    //   );
    // }
    return listArticle;
  }
}

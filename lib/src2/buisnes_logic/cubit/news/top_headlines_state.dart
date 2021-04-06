part of 'top_headlines_cubit.dart';

class TopHeadlinesInitial extends Equatable {
  final List<Article> article;

  TopHeadlinesInitial({
    @required this.article,
  });

  @override
  // TODO: implement props
  List<Object> get props => [article];
}

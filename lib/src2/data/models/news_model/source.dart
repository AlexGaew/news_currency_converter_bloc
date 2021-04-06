import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:news_currency_converter_bloc/src/data/models/news_model/article.dart';

class Source extends Equatable {
  final String id;
  final String name;

  Source({
    @required this.id,
    @required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) =>
      Source(id: json['id'], name: json['name']);

  factory Source.fromArticle(Article article) =>
      Source(id: article.source['id'], name: article.source['name']);

  @override
  // TODO: implement props
  List<Object> get props => [id, name];
}

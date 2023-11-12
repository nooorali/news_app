import 'package:flutter/material.dart';

import '../../../core/network_layer/api_manager.dart';
import '../../../models/category_model.dart';
import '../../../models/source_model.dart';
import 'news_article_item.dart';

class NewsArticalsList extends StatelessWidget {
  Source source;

  NewsArticalsList({
    super.key,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticalsModel>(
      future: ApiManager.fetchArticals(sourceId: source.id!),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Articles> articalsList = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(20),
            itemBuilder: (context, index) =>
                NewsArticalItem(articles: articalsList[index]),
            itemCount: articalsList.length,
          ),
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:news_app/models/source_model.dart';

import '../core/network_layer/api_manager.dart';
import '../models/category_model.dart';
import '../pages/home/widgets/news_article_item.dart';

class SearchNews extends SearchDelegate{

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        showResults(context);
      }, icon: Icon(Icons.search)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.of(context).pop();
    }, icon: Icon(Icons.clear));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<ArticalsModel>(
      future: ApiManager.fetchArticals(searchKeyWord: query),
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

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text("Suggestions");
  }

}
import 'package:flutter/foundation.dart';

class SourceModel{
  String? status;
  String ?code;
  String ?message;
  List<Source>? sources;

  SourceModel({
    this.status,
    this.code,
    this.message,
    this.sources,
  });

  factory SourceModel.fromJason(Map< String , dynamic> jason){
    return SourceModel(
        status: jason["status"],
        code: jason["code"] ?? "",
        message: jason["message"] ?? "",
        sources: List<Source>.from(jason["sources"].map((e) => Source.fromJason(e)),
    ),);
  }
}
class Source{
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;

  Source({this.id,this.name,this.description,this.url,this.category,});

  factory Source.fromJason(Map<String,dynamic> jason){
    return Source(
      id: jason["id"],
      name: jason["name"],
      description:jason["description"] ,
      url: jason["url"],
      category: jason["category"],
    );
  }

}
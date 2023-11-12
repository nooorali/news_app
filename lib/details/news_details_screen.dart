import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName="news details";
  const NewsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments as Articles;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("news details"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(args.urlToImage ?? ""),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                args.source?.name ?? "",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF79828B),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                args.title ?? "",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF42505C),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(args.description?? ""),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(onPressed: (){
                    openUrl(args.url);
                  },label: Icon(Icons.forward),icon:Text("view all articles"),),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openUrl(String? url)async {
    if(url==null){
      return;
    }
    var uri =Uri.parse(url);
    if(await canLaunchUrl(uri)){
      launchUrl(uri);
    }
  }
}

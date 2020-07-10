import 'dart:convert';

import 'package:news_flutter/models/article_models.dart';
import 'package:http/http.dart' as http ;

class News{
  List<ArticleModels> news = [];

 Future<void> getNews() async{
   String url = "http://newsapi.org/v2/top-headlines?country=eg&apiKey=911e35fb65a748cbb2df5d17fc78a501";

   var response = await http.get(url);
   var jsonData = jsonDecode(response.body);
   if(jsonData["status"] == "ok"){
     jsonData["articles"].forEach((element){
       if(element["urlToImage"] != null && element["description"] != null){

         ArticleModels articleModels = ArticleModels(

           title: element["title"],
           author: element["author"],
           description: element["description"],
           url: element["url"],
           urlToImage: element["urlToImage"],
           content: element["content"],
         );

         news.add(articleModels);

       }
     });
   }
 }
}

class CategoryNews{
  List<ArticleModels> news = [];

  Future<void> getNews(String category) async{
    String url = "http://newsapi.org/v2/top-headlines?category=$category&country=eg&apiKey=911e35fb65a748cbb2df5d17fc78a501";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData["status"] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null){

          ArticleModels articleModels = ArticleModels(

            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
          );

          news.add(articleModels);

        }
      });
    }
  }
}
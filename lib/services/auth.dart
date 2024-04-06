import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;


class News{

  final String? apiKey=dotenv.env['API_KEY'];

  List<ArticleModel> news = [];
  List<ArticleModel> businessNews= [];
  List<ArticleModel> sportNews= [];
  List<ArticleModel> technologyNews= [];
  List<ArticleModel> healthNews= [];
  List<ArticleModel> scienceNews= [];
  List<ArticleModel> generalNews= [];



  Future<void> helperNews(String url,List<ArticleModel> catNews ) async{


    Uri uri = Uri.parse(url); // Convert the String URL to a Uri
    var response = await http.get(uri);

    // Handle the response as needed
    print(response.statusCode);
    print(response.body);

    var jsonData = jsonDecode(response.body);
    if(jsonData["status"] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null &&
         element["description"] != null &&
          // element["author"] !=null &&
           element["title"] !=null
          //  element["publishedAt" ]!= null &&
          //  element["content"] !=null
           ){
          ArticleModel articleModel = ArticleModel(
            author: element["author"],
            title: element["title"],
            description: element["description"], url: element["url"],
            urlToImage: element["urlToImage"],
            publishedAt:element["publishedAt"],
            content:element["content"]);
            catNews.add(articleModel);
        }

      });


    }


  }
}
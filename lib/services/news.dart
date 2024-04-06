
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





 //BUSINESS
  Future<void> getBusinessNews()async{
    String cat="business";
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=$cat&apiKey=$apiKey";
    await helperNews(url, businessNews);
  }
  // SPORT
  Future<void> getSportNews()async{
    String cat="sports";
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=$cat&apiKey=$apiKey";
    await helperNews(url, sportNews);
  }
  // TECHNOLY
  Future<void> getTechnologyNews()async{
    String cat="technology";
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=$cat&apiKey=$apiKey";
    await helperNews(url, technologyNews);
  }

  // health
  Future<void> getHealthNews()async{
    String cat="health";
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=$cat&apiKey=$apiKey";
    await helperNews(url,healthNews);
  }

  // science
  Future<void> getScienceNews()async{
    String cat="science";
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=$cat&apiKey=$apiKey";
    await helperNews(url,healthNews);
  }

  // general
  Future<void> getGeneralNews()async{
    String cat="science";
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=$cat&apiKey=$apiKey";
    await helperNews(url,healthNews);
  }


  // entertainment
  Future<void> getEntNews()async{
    String cat="entertainment";
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=$cat&apiKey=$apiKey";
    await helperNews(url,healthNews);
  }


  Future<void> getNews() async{
    // String url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f9b36405f1df4e25b7bf1af270d5111f";
    String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey";

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
            news.add(articleModel);
        }

      });


    }


  }



}


// class CategoryNews{


//   List<ArticleModel> news = [];
//   Future<void> getNews(String category) async{
//     // String url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f9b36405f1df4e25b7bf1af270d5111f";
//     String url = "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=f9b36405f1df4e25b7bf1af270d5111f";

//     Uri uri = Uri.parse(url); // Convert the String URL to a Uri
//     var response = await http.get(uri);

//     // Handle the response as needed
//     print(response.statusCode);
//     print(response.body);

//     var jsonData = jsonDecode(response.body);
//     if(jsonData["status"] == "ok"){
//       jsonData["articles"].forEach((element){
//         if(element["urlToImage"] != null &&
//          element["description"] != null &&
//           // element["author"] !=null &&
//            element["title"] !=null
//           //  element["publishedAt" ]!= null &&
//           //  element["content"] !=null
//            ){
//           ArticleModel articleModel = ArticleModel(
//             author: element["author"],
//             title: element["title"],
//             description: element["description"], url: element["url"],
//             urlToImage: element["urlToImage"],
//             publishedAt:element["publishedAt"],
//             content:element["content"]);
//             news.add(articleModel);
//         }

//       });


//     }


//   }



// }







import 'package:flutter/material.dart';
import 'package:mug_app/providers/mug_news_notify.dart';
import 'package:mug_app/screens/news2.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  static const routeName = "/news";
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Future<void> _refresh(BuildContext context) async {
    print("fetching data");
    
    await Provider.of<MugNewsProvider>(context, listen: false)
        .fetchNews();
    
  }
  @override
  Widget build(BuildContext context) {
    // return const Scaffold(

    //   body: Center(child:Text("News App"),),
    // );
    return RefreshIndicator(
      onRefresh: () => _refresh(context),
      child: NewsScreenSecond());
  }
}
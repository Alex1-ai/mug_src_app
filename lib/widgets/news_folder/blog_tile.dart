import 'package:flutter/material.dart';
import 'package:mug_app/widgets/news_folder/article_view.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;
  const BlogTile({super.key, required this.imageUrl, required this.title, required this.desc, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
        MaterialPageRoute(
          builder: (context)=>ArticleView(blogUrl: url),), );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        child: Column(
    
          children: [
            //Image.network(imageUrl),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: FadeInImage(
                  // width: 120,
                  // height: 70,
                  placeholder: AssetImage('assets/images/placeholder_empty.png'), // Static placeholder image
                  image: NetworkImage(imageUrl), // Network image URL
                  fit: BoxFit.cover, // Image fit
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/placeholder_error.jpeg'); // Error image to display
                  },
                ),
            ),
              SizedBox(height: 8,),
    
    
            Text( title,   style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            SizedBox(height: 1,),
            // TODO: Slice the description to a certain size
            Text(desc)
          ],
        ),
    
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';
import 'details.dart';
class MugBlogTile extends StatelessWidget {
  final String? imageUrl, title, desc, date;

  const MugBlogTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title != null && desc != null && imageUrl != null && date != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(
                title: title!,
                description: desc!,
                image: imageUrl!,
                updatedAt: date!,
              ),
            ),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imageUrl != null)
               AspectRatio(
          aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: FadeInImage(
              placeholder: AssetImage('assets/images/placeholder_empty.png'),
              // image: NetworkImage(imageUrl!),
              image: NetworkImage("${AppConstants.MUG_REST_API_BASE}${imageUrl}"),
              fit: BoxFit.cover, // This ensures the image covers the available space
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/images/placeholder_error.jpeg');
              },
            ),
          ),
        ),
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(6),
              //   child: FadeInImage(
              //     placeholder: AssetImage('assets/images/placeholder_empty.png'),
              //     // image: NetworkImage(imageUrl!),
              //     image: NetworkImage("${AppConstants.MUG_REST_API_BASE}${imageUrl}"),
              //     fit: BoxFit.fill,
              //     imageErrorBuilder: (context, error, stackTrace) {
              //       return Image.asset('assets/images/placeholder_error.jpeg');
              //     },
              //   ),
              // ),
            SizedBox(height: 8,),
            if (title != null)
              Text(title!, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            SizedBox(height: 1,),
            if (desc != null )
              Text('${desc!.substring(0, 150)}...'),
              // Text(desc != null ? (desc?.length > 50 ? '${desc.substring(0, 50)}...' : desc) : ''),

          ],
        ),
      ),
    );
  }
}

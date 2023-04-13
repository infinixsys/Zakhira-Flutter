import 'package:flutter/material.dart';
import 'package:zakira/View/review/product_review.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>const ProductReviewScreen() ,));
      },
      child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Reviews (177)",
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,)
                      ],
                    )
                  ],
                ),
              ),
            ),
    
            // comment Section
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Text(
                  "T",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              title: Text("Amit"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "05/11/2022",
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.grey[500]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "The product is amazing you can't afford a product of this range anywhere.Just go for it. ",
                    maxLines:1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.grey[500]),
                  )
                ],
              ),
            )
          ],
        
      ),
    );
  }
}

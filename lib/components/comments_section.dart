import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentsSection extends StatefulWidget {
  Text title;
  CommentsSection({required this.title, super.key});

  @override
  State<CommentsSection> createState() => _CommentsSectionState();
}

class _CommentsSectionState extends State<CommentsSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.heart_fill,
                      color: Colors.red,
                      size: 16,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "You and 2 other",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.thumb_up_sharp,
                  color: Colors.blue,
                  size: 16,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  5,
                  (index) {
                    return Text("Comment");
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200], // Light grey background
                borderRadius: BorderRadius.circular(98), // Rounded corners
              ),
              height: 60,
              width: 390, // Adjust width as per your requirement
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      child: Icon(
                        CupertinoIcons.person_fill,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                  ),

                  // Spacing between avatar and text field
                  Expanded(
                    child: TextField(
                      minLines: 1,
                      maxLines: 2,
                      decoration: InputDecoration(
                        hintText: "Write a Comment",
                        hintStyle: TextStyle(
                          color: Color(0xFF98A2B3),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 63,
                    decoration: BoxDecoration(
                      color: Color(0xFF004852), // Teal color for the button
                      borderRadius: BorderRadius.horizontal(right: Radius.circular(98)),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.yellowAccent,
                        size: 24,
                      ),
                      onPressed: () {
                        // Action on send button press
                      },
                    ),
                  ),
                ],
              ),
            ),
            /*Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 70,
                    child: TextFormField(
                      minLines: 2,
                      maxLines: 4,
                      decoration: InputDecoration(
                        suffix: Container(
                          constraints: BoxConstraints(
                            maxHeight: double.infinity,
                            minHeight: 0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(100),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.send),
                          ),
                        ),
                        hintText: "Write a comment",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        prefixIcon: Icon(
                          CupertinoIcons.person_fill,
                          color: Colors.grey,
                          size: 35,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(100),
                            right: Radius.circular(100),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                      ),
                    ),
                  ),
                ),
                */
            /*              Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade900,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(100),
                    ),
                  ),
                  //width: 50,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send,
                      color: Colors.lightGreenAccent,
                    ),
                  ),
                ),*/
          )
        ],
      ),
    );
  }
}

/*
Row(
children: [
TextFormField(
decoration: InputDecoration(
hintText: "Write a comment",
 hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
   prefixIcon: Icon(
    CupertinoIcons.person_fill,
    color: Colors.grey,
     size: 35,
   ),
 border: OutlineInputBorder(
   borderRadius: BorderRadius.horizontal(left: Radius.circular(100)),
   borderSide: BorderSide.none,
  ),
 fillColor: Colors.grey.shade200,
 filled: true,
),
),

],
),


 */

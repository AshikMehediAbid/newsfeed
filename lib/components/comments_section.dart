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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Reactions"),
              Text("Add react"),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                  Text("Comment section"),
                ],
              ),
            ),
          ),
          Row(
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
            ],
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

import 'package:ezycourse_my_project/components/comments_section.dart';
import 'package:flutter/material.dart';

class SinglePost extends StatefulWidget {
  const SinglePost({super.key});

  @override
  State<SinglePost> createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20.0,
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Icon(
                Icons.person,
                size: 35,
                color: Colors.grey,
              ),
            ),
            title: Text(
              "Alexander John",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              "2 days ago",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF667085),
              ),
            ),
            trailing: Icon(Icons.more_vert),
          ),
          Divider(
            thickness: .1,
          ),

          /// Post
          Text(
            "Hello everyone   this is a post from app to see if attached link is working or not. Here is a link https://www.merriam-webster.com/dictionary/link  but I think this is not working. This should work but not working!!!!",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),

          /// if image
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 10,
            ),
            child: Container(
              width: double.infinity,
              child: Image.asset(
                fit: BoxFit.fitWidth,
                "assets/images/post.png",
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "👍🧡",
                  ),
                  SizedBox(width: 10),
                  Text(
                    "You and 2 other",
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.mode_comment_outlined),
                  Text(
                    "12 Comments",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.thumb_up_sharp,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Like",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
              TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * .75,
                              child: CommentsSection(
                                title: Text("aaa"),
                              ),
                            ),
                          );
                        });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.mode_comment),
                      Text(
                        "Comment",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}

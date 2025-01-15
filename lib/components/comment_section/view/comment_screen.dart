import 'package:ezycourse_my_project/components/comment_section/view_model/comment_controller.dart';
import 'package:ezycourse_my_project/components/single_comment.dart';
import 'package:ezycourse_my_project/core/api_response/comment_api_response/create_comment_response.dart';
import 'package:ezycourse_my_project/core/api_response/comment_api_response/get_comment_api_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentScreen extends ConsumerStatefulWidget {
  int feedID;
  int reactCount;
  CommentScreen({required this.feedID, super.key, required this.reactCount});

  @override
  ConsumerState<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends ConsumerState<CommentScreen> {
  TextEditingController _commentController = TextEditingController();
  List<GetCommentApiResponse> getCommentList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_Comment();
  }

  void get_Comment() async {
    getCommentList = await ref.read(commentProvider.notifier).getComments(widget.feedID);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Padding(
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
                        "You and ${widget.reactCount} other",
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
                    getCommentList.length,
                    (index) => SingleComment(
                      commentModel: getCommentList[index],
                    ),
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
                        controller: _commentController,
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
                        onPressed: () async {
                          CommentApiResponse response = await ref.read(commentProvider.notifier).createComment(
                                feed_id: widget.feedID,
                                comment_txt: _commentController.text.trim(),
                              );
                          get_Comment();
                          _commentController.clear();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

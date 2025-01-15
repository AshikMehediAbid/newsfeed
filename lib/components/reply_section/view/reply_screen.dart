import 'package:ezycourse_my_project/components/reply_section/view_model/reply_controller.dart';
import 'package:ezycourse_my_project/components/single_reply.dart';
import 'package:ezycourse_my_project/core/api_response/reply_api_response/get_reply_api_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReplyScreen extends ConsumerStatefulWidget {
  int parentCommentID, feedUserID, feedID;
  final String parentCommentTExt, parentCommentUserName, parentCommentUserPic;
  ReplyScreen(
      {required this.parentCommentID,
      required this.parentCommentTExt,
      required this.feedUserID,
      required this.feedID,
      required this.parentCommentUserName,
      required this.parentCommentUserPic,
      super.key});

  @override
  ConsumerState<ReplyScreen> createState() => _ReplyScreenState();
}

class _ReplyScreenState extends ConsumerState<ReplyScreen> {
  TextEditingController _replyController = TextEditingController();
  List<GetReplyApiResponse> getReplyList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_Reply();
  }

  void get_Reply() async {
    getReplyList = await ref.read(replyProvider.notifier).getReply(widget.parentCommentID);
    setState(() {});
    print(getReplyList.length);
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
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Column(
                children: [
                  Row(
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
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipOval(
                        child: Image.network(
                          widget.parentCommentUserPic,
                          fit: BoxFit.fill,
                          height: 55,
                          width: 55,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF0F2F5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title: Text(
                              widget.parentCommentUserName,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              widget.parentCommentTExt,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF272935),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Column(
                    children: List.generate(
                      getReplyList.length,
                      (index) => SingleReply(
                        replyModel: getReplyList[index],
                      ),
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
                        controller: _replyController,
                        minLines: 1,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: "Write a reply...",
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
                          await ref.read(replyProvider.notifier).addReply(
                                feed_id: widget.feedID,
                                feed_user_id: widget.feedUserID,
                                parrent_id: widget.parentCommentID,
                                comment_txt: _replyController.text.toString().trim(),
                              );
                          get_Reply();
                          _replyController.clear();
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

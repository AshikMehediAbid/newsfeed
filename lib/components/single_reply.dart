import 'package:ezycourse_my_project/core/api_response/reply_api_response/get_reply_api_response.dart';
import 'package:flutter/material.dart';

class SingleReply extends StatefulWidget {
  final GetReplyApiResponse replyModel;
  SingleReply({
    super.key,
    required this.replyModel,
  });

  @override
  State<SingleReply> createState() => _SingleReplyState();
}

class _SingleReplyState extends State<SingleReply> {
  String timeAgo(String updatedAt) {
    DateTime updatedDateTime = DateTime.parse(updatedAt);
    DateTime currentTime = DateTime.now().toUtc();
    Duration difference = currentTime.difference(updatedDateTime);

    if (difference.inDays > 0) {
      return "${difference.inDays}d";
    } else if (difference.inHours > 0) {
      return "${difference.inHours}h";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes}m";
    } else {
      return "now";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.network(
                  widget.replyModel.user.profilePic,
                  fit: BoxFit.fill,
                  height: 45,
                  width: 45,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF0F2F5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          widget.replyModel.user.fullName,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          widget.replyModel.commentText,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF272935),
                          ),
                        ),
                        trailing: Icon(Icons.more_vert),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 75,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        timeAgo(widget.replyModel.updatedAt),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF667085),
                        ),
                      ),
                      Text("Like"),
                      /*TextButton(
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
                                    height: MediaQuery.of(context).size.height * .80,
                                    width: MediaQuery.of(context).size.width,
                                    child: ReplyScreen(
                                      parentCommentID: widget.replyModel.id,
                                      parentCommentTExt: widget.replyModel.commentText,
                                      feedUserID: widget.replyModel.userId,
                                      feedID: widget.replyModel.feedId,
                                      parentCommentUserName: widget.replyModel.user.fullName,
                                      parentCommentUserPic: widget.replyModel.user.profilePic,
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Text("Reply"),
                      ),*/
                    ],
                  ),
                ),
                SizedBox(width: 150),
                Text("data"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

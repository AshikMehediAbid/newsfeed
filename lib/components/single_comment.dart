import 'package:ezycourse_my_project/core/api_response/comment_api_response/get_comment_api_response.dart';
import 'package:flutter/material.dart';

class SingleComment extends StatefulWidget {
  final GetCommentApiResponse commentModel;
  SingleComment({
    super.key,
    required this.commentModel,
  });

  @override
  State<SingleComment> createState() => _SinglePostState();
}

class _SinglePostState extends State<SingleComment> {
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
        horizontal: 15,
        vertical: 5,
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              widget.commentModel.user.profilePic,
              fit: BoxFit.fill,
              height: 55,
              width: 55,
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
                      widget.commentModel.user.fullName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      widget.commentModel.commentText,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF272935),
                      ),
                    ),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              timeAgo(widget.commentModel.updatedAt),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF667085),
                              ),
                            ),
                            Text("Like"),
                            TextButton(
                              onPressed: () {
                                /* Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) => ReplyScreen(feedID: 123)));
                                */
                              },
                              child: Text("Reply"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 120),
                      Text("data"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

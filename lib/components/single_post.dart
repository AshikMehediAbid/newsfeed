import 'package:ezycourse_my_project/components/comment_section/view/comment_screen.dart';
import 'package:ezycourse_my_project/core/api_response/feed_api_response/get_feed_api_model.dart';
import 'package:flutter/material.dart';

class SinglePost extends StatefulWidget {
  final String text, name, profilePic;
  final String? pic;
  final String updatedAt;
  final feedId;
  final FeedApiResponse feedModel;
  SinglePost({
    super.key,
    required this.text,
    required this.name,
    required this.profilePic,
    this.pic,
    required this.updatedAt,
    required this.feedModel,
    this.feedId,
  });

  @override
  State<SinglePost> createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  String timeAgo(String updatedAt) {
    DateTime updatedDateTime = DateTime.parse(updatedAt);
    DateTime currentTime = DateTime.now().toUtc();
    Duration difference = currentTime.difference(updatedDateTime);

    if (difference.inDays > 0) {
      return "${difference.inDays} days ago";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} hours ago";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} minutes ago";
    } else {
      return "Just now";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: ClipOval(
            child: Image.network(
              widget.profilePic,
              fit: BoxFit.fill,
              width: 50,
              height: 50,
            ),
          ),
          title: Text(
            widget.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            timeAgo(widget.updatedAt),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
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
            child: Image.network(
              widget.pic ?? "",
              fit: BoxFit.fitWidth,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "👍🧡",
                  ),
                  SizedBox(width: 10),
                  Text(
                    "You and ${widget.feedModel.likeCount} other",
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
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
                            child: CommentScreen(
                              reactCount: widget.feedModel.likeCount,
                              //title: Text("aaa"),
                              feedID: widget.feedId,
                            ),
                          ),
                        );
                      });
                },
                child: Text(
                  "${widget.feedModel.commentCount} Comments",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
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
                            height: MediaQuery.of(context).size.height * .80,
                            child: CommentScreen(
                              reactCount: widget.feedModel.likeCount,
                              //title: Text("aaa"),
                              feedID: widget.feedId,
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
                ),
              ),
            ],
          ),
        ),

        Divider(
          thickness: 5,
        ),
      ],
    );
  }
}

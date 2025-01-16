import 'package:ezycourse_my_project/components/comment_section/view/comment_screen.dart';
import 'package:ezycourse_my_project/components/react/model/reaction_model.dart';
import 'package:ezycourse_my_project/components/react/view_model/react_controller.dart';
import 'package:ezycourse_my_project/screens/feed/model/get_feed_api_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SinglePost extends ConsumerStatefulWidget {
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
  ConsumerState<SinglePost> createState() => _SinglePostState();
}

class _SinglePostState extends ConsumerState<SinglePost> {
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

  Row? reaction;
  bool isReact = false;
  String? REACTION;

  OverlayEntry? _overlayEntry;

  void showReactionDialog(BuildContext context, Offset position) {
    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Dismiss dialog when tapping outside
          GestureDetector(
            onTap: hideReactionDialog,
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Positioned(
            left: position.dx, // Adjust horizontally
            top: position.dy - 130, // Adjust vertically
            child: Material(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              color: Colors.white,
              child: GestureDetector(
                // Dismiss dialog when tapping an option
                onTap: hideReactionDialog,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      reactList.length,
                      (index) {
                        return GestureDetector(
                          onTap: () async {
                            setState(() {
                              isReact = true;
                              REACTION = reactList[index].REACT;
                              reaction = Row(
                                children: [
                                  Image.asset(
                                    reactList[index].iconURL,
                                    height: 20,
                                    width: 20,
                                  ),
                                  Text("  ${reactList[index].react}",
                                      style: TextStyle(color: reactList[index].rectColor)),
                                ],
                              );
                            });
                            hideReactionDialog();
                            await ref
                                .read(reactProvider.notifier)
                                .addReact(feed_id: widget.feedId, reactionType: REACTION!);
                          },
                          child: Row(
                            children: [
                              Image.asset(reactList[index].iconURL),
                              SizedBox(width: 10),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void hideReactionDialog() {
    _overlayEntry?.remove();
    _overlayEntry = null;
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
              GestureDetector(
                onLongPressStart: (details) async {
                  // Show the dialog on long press
                  showReactionDialog(context, details.globalPosition);

                  print("Clicked");
                },
                onTap: () async {
                  print(isReact);
                  setState(() {
                    reaction = (isReact == true)
                        ? Row(
                            children: [
                              Icon(
                                Icons.thumb_up_alt_outlined,
                                size: 20,
                              ),
                              Text("  Like", style: TextStyle(color: Colors.grey)),
                            ],
                          )
                        : Row(
                            children: [
                              Image.asset(
                                'assets/images/reaction/like.png',
                                height: 20,
                                width: 20,
                              ),
                              Text("  Like", style: TextStyle(color: Colors.blue)),
                            ],
                          );

                    isReact = !isReact;
                  });

                  //await ref.read(reactProvider.notifier).addReact(feed_id: widget.feedId, reactionType: "ANGRY");
                },
                child: reaction ??
                    Row(
                      children: [
                        Icon(
                          Icons.thumb_up_alt_outlined,
                          size: 20,
                        ),
                        Text("  Like", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
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

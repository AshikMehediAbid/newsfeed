import 'package:ezycourse_my_project/components/single_post.dart';
import 'package:ezycourse_my_project/screens/create_post/view/create_post_screen.dart';
import 'package:ezycourse_my_project/screens/feed/view_model/newsfeed_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Newsfeed extends ConsumerStatefulWidget {
  const Newsfeed({super.key});

  @override
  ConsumerState<Newsfeed> createState() => _NewsfeedState();
}

class _NewsfeedState extends ConsumerState<Newsfeed> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ref.read(newsfeedProvider.notifier).get_Feed();
  }

  Future<void> _pullRefresh() async {
    ref.read(newsfeedProvider.notifier).get_Feed();
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    final newsfeedController = ref.watch(newsfeedProvider);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu_outlined,
          color: Colors.white,
        ),
        backgroundColor: Colors.teal,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Flutter Developer Community",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              "#General",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.teal,
        onRefresh: _pullRefresh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        child: Icon(
                          CupertinoIcons.person_fill,
                          size: 60,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Write something here..",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CreatePostScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.teal.shade900,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                            child: Text(
                              "Post",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (newsfeedController.feedModelList.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(child: Text("No posts available. Pull to refresh.")),
                )
              else
                ...List.generate(
                  newsfeedController.feedModelList.length,
                  (index) => SinglePost(
                    name: newsfeedController.feedModelList[index].name,
                    profilePic: newsfeedController.feedModelList[index].user.profilePic,
                    text: newsfeedController.feedModelList[index].feedText,
                    pic: newsfeedController.feedModelList[index].pic,
                    updatedAt: newsfeedController.feedModelList[index].updatedAt,
                    feedId: newsfeedController.feedModelList[index].id,
                    feedModel: newsfeedController.feedModelList[index],
                  ),
                ),

              /*            Card(
                color: Colors.teal,
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                            child: Container(
                              height: MediaQuery.of(context).size.height * .6,
                              child: CommentsSection(
                                title: Text("aaa"),
                              ),
                            ),
                          );
                        });
                  },
                  child: Text(
                    "Add comment",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}

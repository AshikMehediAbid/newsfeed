import 'package:ezycourse_my_project/components/single_post.dart';
import 'package:ezycourse_my_project/screens/create_post_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Newsfeed extends StatefulWidget {
  const Newsfeed({super.key});

  @override
  State<Newsfeed> createState() => _NewsfeedState();
}

class _NewsfeedState extends State<Newsfeed> {
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                color: Colors.white,
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
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        child: Icon(
                          CupertinoIcons.person_fill,
                          size: 60,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      suffix: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.teal.shade900,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                            child: Text(
                              "Post",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CreatePostScreen(),
                      ),
                    );
                  },
                ),
              ),
            ),

            ...List.generate(
              10,
              (index) => SinglePost(),
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

            // CommentsSection(
            //   title: Text("abc"),
            // )
          ],
        ),
      ),
    );
  }
}

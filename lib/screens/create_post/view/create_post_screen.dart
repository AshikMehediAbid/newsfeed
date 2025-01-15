import 'package:ezycourse_my_project/models/color_model.dart';
import 'package:ezycourse_my_project/screens/create_post/view_model/create_post_controller.dart';
import 'package:ezycourse_my_project/screens/feed/view_model/newsfeed_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePostScreen extends ConsumerStatefulWidget {
  const CreatePostScreen({super.key});

  @override
  ConsumerState<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends ConsumerState<CreatePostScreen> {
  TextEditingController _text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final createPostController = ref.watch(createPostProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Close",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                Text(
                  "Create Post",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    print("Clicked");
                    if (_text.text.toString().trim().isNotEmpty) {
                      String x = await ref.read(newsfeedProvider.notifier).createPost(
                          feed_txt: _text.text.toString().trim(), is_background: createPostController.isBackground);
                      _text.clear();
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    "Create",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Card(
              child: TextFormField(
                controller: _text,
                minLines: 6,
                maxLines: 15,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: "What's on your mind?",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  fillColor: createPostController.backgroundColor,
                  filled: true,
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    ref.read(createPostProvider.notifier).toggleShowBgColor();
                  },
                  child: Card(
                    color: Colors.white,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(),
                      child: Icon(
                        (createPostController.showBgColor == false) ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                        size: 18,
                      ),
                    ),
                  ),
                ),
                (createPostController.showBgColor == true)
                    ? Row(
                        children: List.generate(
                          colorList.length,
                          (index) {
                            return GestureDetector(
                              onTap: () {
                                ref.read(createPostProvider.notifier).changeBgColor(index);
                              },
                              child: Card(
                                color: colorList[index].boxColor,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      //borderRadius: BorderRadius.circular(5),
                                      ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Row()
              ],
            )
          ],
        ),
      ),
    );
  }
}

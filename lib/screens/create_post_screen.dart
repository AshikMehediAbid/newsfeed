import 'package:ezycourse_my_project/models/color_model.dart';
import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  bool isTapped = false;
  Icon checkBoxIcon = Icon(Icons.arrow_forward_ios);
  Color backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
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
                Text(
                  "Create",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Card(
              child: TextFormField(
                minLines: 6,
                maxLines: 15,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: "What's on your mind?",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  fillColor: backgroundColor,
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
                    setState(() {
                      isTapped = !isTapped;
                    });
                  },
                  child: Card(
                    color: Colors.white,
                    child: Container(
                      child: Icon(
                        (isTapped == false) ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                        size: 18,
                      ),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(),
                    ),
                  ),
                ),
                (isTapped == true)
                    ? Row(
                        children: List.generate(
                          colorList.length,
                          (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  backgroundColor = colorList[index].boxColor;
                                });
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

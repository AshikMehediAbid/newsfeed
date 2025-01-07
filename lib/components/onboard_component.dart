import 'package:flutter/material.dart';

class OnboardComponent extends StatefulWidget {
  final int? screenNo;
  final String imageUrl, heading, description;

  const OnboardComponent({
    this.screenNo,
    super.key,
    required this.imageUrl,
    required this.heading,
    required this.description,
  });

  @override
  State<OnboardComponent> createState() => _OnboardComponentState();
}

class _OnboardComponentState extends State<OnboardComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            (widget.screenNo == 0)
                ? Row(
                    children: [
                      Spacer(),
                      Container(
                        height: MediaQuery.of(context).size.height * .40,
                        child: Image.asset(
                          fit: BoxFit.fill,
                          widget.imageUrl,
                        ),
                      ),
                    ],
                  )
                : ((widget.screenNo == 1)
                    ? Container(
                        color: Colors.blue,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .40,
                        child: Image.asset(
                          fit: BoxFit.fill,
                          widget.imageUrl,
                        ),
                      )
                    : Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .40,
                            child: Image.asset(
                              fit: BoxFit.fill,
                              widget.imageUrl,
                            ),
                          ),
                          Spacer(),
                        ],
                      )),
            SizedBox(height: 30),
            Text(
              widget.heading,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                widget.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

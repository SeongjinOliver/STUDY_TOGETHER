import 'package:flutter/material.dart';

import '../config/studyTogetherColors.dart';

class DetailPage extends StatefulWidget {
  DetailPage(this.doc, this.imgUrl, {Key? key}) : super(key: key);
  dynamic doc;
  String imgUrl;
  @override
  State<DetailPage> createState() => _DetailPageState(doc, imgUrl!);
}

class _DetailPageState extends State<DetailPage> {
  dynamic document;
  String? imageUrl;
  _DetailPageState(var doc, String imgUrl) {
    document = doc;
    imageUrl = imgUrl;
  }
  @override
  Widget build(BuildContext context) {
    String title = document.get("title");
    String description = document.get("description");
    String attendance = document.get("attendance");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Study Together",
          style: TextStyle(
            color: StudyTogetherColors.color4,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      '$title',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Text(
                      '',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
              // Text(
              //   "Hello detail page!!!!!!!!!!!!!!!!!!!!",
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              // ),
              SizedBox(height: 20),
              Center(
                child: Image.network(
                  imageUrl!,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '$description',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    flex: 15,
                  ),
                  Expanded(
                    child: Text(
                      '',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "참여방법",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 13,
                            top: 10,
                            bottom: 10,
                          ),
                          child: Text(
                            '$attendance',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'model.dart';

class ReadingNews extends StatelessWidget {
  final NewsApiModel model;

  const ReadingNews({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor:Colors.grey.shade300,
        body: Container(


          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
             // color: Colors.white,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                ),
                Card(
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: size.width / 1.05,
                          child: Text(
                            model.title,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                Container(
                  height: size.height / 3,
                  width: size.width / 1.05,
                  alignment: Alignment.center,
                  child: model.imageUrl != ""
                      ? Image.network(
                    model.imageUrl,
                    fit: BoxFit.cover,
                  )
                      : Text(
                    "Unable to load image",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                     // fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  width: size.width / 1.05,
                  child: Text(
                    model.content,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                     // fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
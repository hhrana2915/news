import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'model.dart';
import 'news_api.dart';
import 'news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NewsApiModel>? newsList;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews().then((value) {
      setState(() {
        if (value.isNotEmpty) {
          newsList = value;
          isLoading = false;
        } else {
          print("List is Empty");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: size.height / 12,
                width: size.width / 1,
                child: Row(
                  children: [
                    Icon(
                      Icons.menu,
                      // color: Colors.white,
                    ),
                    SizedBox(
                      width: size.width / 4,
                    ),
                    Text(
                      "Coinstelly",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        //color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              isLoading
                  ? Container(
                height: size.height / 20,
                width: size.height / 20,
                child: CircularProgressIndicator(),
              )
                  : Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: newsList!.length,
                    itemBuilder: (context, index) {
                      return listItems(size, newsList![index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listItems(Size size, NewsApiModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ReadingNews(
              model: model,
            ),
          ),
        ),

        child: Container(
          //padding: EdgeInsets.only(bottom: 10),
         // width: size.width / 1.15,

          child: Card(
            child: Row(
              children: [
                Card(
                    elevation: 5.0,
                    margin: EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.8,
                    height: MediaQuery.of(context).size.width / 2.8,

                  child: model.imageUrl != ""
                  ? Image.network(
                model.imageUrl,
                fit: BoxFit.cover,
                  )
                  : Text("Cant Load image"),
                ),
                ),

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        //height: MediaQuery.of(context).size.width / 2.5,
                        child: Text(
                          model.title,maxLines: 20,overflow: TextOverflow.visible,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                       // height: MediaQuery.of(context).size.width / 2.5,
                        child: Text(model.description,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 12,
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
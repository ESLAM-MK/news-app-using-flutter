import 'package:flutter/material.dart';
import 'package:flutter_application_3/data_provider.dart';
import 'package:flutter_application_3/favorites.dart';
import 'package:flutter_application_3/pages/article_detailed_page.dart';
import 'package:flutter_application_3/services/api_services..dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_3/models/article_model.dart';
// import 'package:flutter_application_3/screens/favorite_page.dart';

import 'components/CustomListTitle.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoritesProvider(),
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
 
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  InkWell(
              onTap: () {
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritePage(

                    ),
                  ),
                );
              },
              child: Container(
                width: 20,
                margin: EdgeInsets.all(2),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Icon(Icons.star),

              ),
            ),
            centerTitle: true,
        title: Text("أحدث الاخبار", style: TextStyle(color: Color.fromARGB(255, 251, 249, 249))),
        backgroundColor: const Color.fromARGB(255, 243, 2, 2),
      ),
      body: InkWell(child:
      FutureBuilder<List<Article>>(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<Article>? articles = snapshot.data;
              return ListView.builder(
                itemCount: articles?.length,
                itemBuilder: (context, index) =>
                    customListTile(articles![index], context),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            }
          }

          // API call is still in progress, display a progress indicator
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      onTap: () {

                         Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ArticlePage(article: Article() ,)),);}),
    );
  }
}
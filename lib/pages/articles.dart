import 'package:flutter/material.dart';
import 'package:posinotes_sqlflite/model/article_model.dart';
import 'package:posinotes_sqlflite/services/api_service.dart';
import 'package:posinotes_sqlflite/widget/custom_list_tile.dart';

class Articles extends StatefulWidget {
  const Articles({
    Key? key,
  }) : super(key: key);

  @override
  Articles_List createState() => Articles_List();
}

class Articles_List extends State<Articles> {
  bool isLoading = false;

  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Color(0XFF3BAAFF),
        automaticallyImplyLeading: false,
        title: Text(
          'Articles',

          style: TextStyle(fontSize: 24),
        ),
        actions: [Icon(Icons.search), SizedBox(width: 12)],
      ),
      body: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article>? articles = snapshot.data;
              return ListView.builder(
                  itemCount: articles?.length,
                  itemBuilder: (context, index) =>
                      customListTile(articles![index], context));
            } else {
              return Center(child: CircularProgressIndicator());
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),




  );
}

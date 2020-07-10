import 'package:flutter/material.dart';
import 'package:news_flutter/data/news.dart';
import 'package:news_flutter/widget/article.dart';
import 'package:news_flutter/models/article_models.dart';

class CategoryList extends StatefulWidget {
CategoryList({this.category});
  final String category;


  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  List<ArticleModels> articles = List<ArticleModels>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    getCategoryNews();
  }

  getCategoryNews() async{
    CategoryNews newsClass = CategoryNews();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, color: Colors.black,),
        elevation: 1.0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Flutter", style: TextStyle(color: Colors.black,)),
            Text("News", style: TextStyle(color: Colors.orange),),
          ],
        ),
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0,),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 16.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: articles.length,
                    itemBuilder: (context, index){
                      return CardNews(
                        imageUrl: articles[index].urlToImage,
                        title: articles[index].title,
                        desc: articles[index].description,
                        url: articles[index].url,
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CardNews extends StatelessWidget {
  CardNews({@required this.imageUrl,@required this.title,@required this.desc, @required this.url});
  final String title, desc, imageUrl, url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Article(

          ),
        ));
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            Container(
              margin: EdgeInsets.all(3),
              child: Text(title, style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              )),
            ),
            Container(
              margin: EdgeInsets.all(3),
              child: Text(desc, style: TextStyle(
                color: Colors.black54,
              )),
            ),
          ],
        ),
      ),
    );
  }
}

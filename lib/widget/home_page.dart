import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/data/data.dart';
import 'package:news_flutter/models/article_models.dart';
import 'package:news_flutter/models/category_models.dart';
import 'package:news_flutter/data/news.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_flutter/widget/article.dart';
import 'package:news_flutter/widget/category_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<CategoryModel> myCategory = List<CategoryModel>();
  List<ArticleModels> articles = List<ArticleModels>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    myCategory = getCategory();
    getNews();
  }

  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;

    setState(() {
     _loading = false;
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: Row(
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

              SizedBox(height: 15.0,),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Categories",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 10.0,),

              // categories
              Container(
                height: 80.0,
                child: ListView.builder(
                  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: myCategory.length,
                    itemBuilder: (context, index){
                      return Category(
                        imageUrl: myCategory[index].imageUrl,
                        categoryName: myCategory[index].categoryName,
                      );
                    },
                ),
              ),

              SizedBox(height: 20.0),


              // NewsList
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

class Category extends StatelessWidget {
Category({this.imageUrl, this.categoryName});
  final imageUrl, categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => CategoryList(
            category: categoryName.toLowerCase(),
          ),
        ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.0 ),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(imageUrl: imageUrl , width: 120, height: 70.0, fit: BoxFit.cover,)),
            Container(
              alignment: Alignment.center,
              width: 120.0,
              height: 70.0,
              color: Colors.orange.withOpacity(0.4),
              child: Text(categoryName, style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),),
            ),
          ],
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
              imageUrl: url,
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
                fontWeight: FontWeight.w700,
              )),
            ),
          ],
        ),
      ),
    );
  }
}


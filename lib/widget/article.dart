import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Article extends StatefulWidget {
Article({this.imageUrl});
  final String imageUrl;

  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {

  final Completer<WebViewController> _completer = Completer<WebViewController>();

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
       body: Container(
         height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
         initialUrl: widget.imageUrl,
          onWebViewCreated: (WebViewController webController){
          _completer.complete(webController);
        },
    ),
       ),
    );
  }
}

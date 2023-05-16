import 'package:uaunews/data/model/article.dart';
import 'package:uaunews/ui/news_detail_page.dart';
import 'package:uaunews/ui/news_webview.dart';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';

import 'ui/news_list_page.dart';

void main() {
  Fimber.plantTree(DebugTree());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UAU NEWS',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: NewsListPage.routeName,
      routes: {
        NewsListPage.routeName: (context) => const NewsListPage(),
        NewsDetailPage.routeName: (context) => NewsDetailPage(
            article: ModalRoute.of(context)?.settings.arguments as Article),
        NewsWebView.routeName: (context) => NewsWebView(
            url: ModalRoute.of(context)?.settings.arguments as String),
      },
    );
  }
}

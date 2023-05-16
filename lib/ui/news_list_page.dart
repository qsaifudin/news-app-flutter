import 'package:uaunews/data/api/api_service.dart';
import 'package:uaunews/data/model/article.dart';
import 'package:uaunews/ui/news_detail_page.dart';
import 'package:flutter/material.dart';

import '../widget/SidebarMenu.dart';
import '../widget/searchnewscreen.dart';

class NewsListPage extends StatefulWidget {
  static const routeName = '/article_list';

  const NewsListPage({super.key});

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  late Future<ArticlesResult> _articles;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _articles = ApiService().getTopHeadlines();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UAU NEWS'),
      ),
      drawer: const SidebarMenu(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                // Perform search/filter logic here
                // Call a function to update the article list based on the search/filter query
              },
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    // Clear the search/filter and display all articles
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _articles,
              builder: (context, AsyncSnapshot<ArticlesResult> snapshot) {
                var state = snapshot.connectionState;
                if (state != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.articles.length,
                      itemBuilder: (context, index) {
                        return _buildArticleItem(
                            context, snapshot.data!.articles[index]);
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return const Center(child: Text('Unknown error'));
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildArticleItem(BuildContext context, Article article) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: article.urlToImage == null
          ? const SizedBox(
              width: 100,
              child: Icon(Icons.error),
            )
          : Image.network(
              article.urlToImage!,
              width: 100,
            ),
      title: Text(article.title),
      subtitle: Text(article.author ?? "Unknown Author"),
      onTap: () {
        Navigator.pushNamed(
          context,
          NewsDetailPage.routeName,
          arguments: article,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

import '../data/model/article.dart';

class SearchNewsScreen extends StatefulWidget {
  const SearchNewsScreen(currentKeyword, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchNewsScreenState createState() => _SearchNewsScreenState();
}

class _SearchNewsScreenState extends State<SearchNewsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Article> _searchResults = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(String keyword) {
    if (keyword.isNotEmpty) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari Berita'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Kata kunci',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    _performSearch(_searchController.text);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final article = _searchResults[index];
                return ListTile(
                  title: Text(article.title),

                  // Tampilkan informasi lainnya sesuai kebutuhan
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SidebarMenu extends StatefulWidget {
  const SidebarMenu({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SidebarMenuState createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  // Daftar kategori
  List<String> categories = ['Berita Utama', 'Technology'];

  // Indeks kategori yang dipilih
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            selected: index == selectedCategoryIndex,
            onTap: () {
              setState(() {
                selectedCategoryIndex = index;
                // Lakukan sesuatu ketika kategori dipilih, misalnya tampilkan berita terkait kategori tersebut.
              });
              Navigator.pop(context); // Tutup sidebar setelah kategori dipilih
            },
          );
        },
      ),
    );
  }
}

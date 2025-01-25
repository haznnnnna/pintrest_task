
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnriverpod/task/photo_provider.dart';

import '../main.dart';
import 'image_page.dart';

class Home extends ConsumerWidget {

  const Home({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final provider = ref.watch(photoProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Wallpapers')),
      body:provider.photos.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: provider.photos.length,
        itemBuilder: (context, index) {
          final photo = provider.photos[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => FullScreenImage(url: photo['src']['original']),
              ),
            ),
            child: Image.network(photo['src']['medium'], fit: BoxFit.cover),
          );
        },
      ),
    );
  }
}

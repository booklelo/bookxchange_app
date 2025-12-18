import 'package:flutter/material.dart';
import '../../data/dummy_books.dart';
import '../../widgets/book_card.dart';

class HomeFeed extends StatelessWidget {
  const HomeFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: dummyBooks.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            return BookCard(book: dummyBooks[index]);
          },
        ),
      ),
    );
  }
}

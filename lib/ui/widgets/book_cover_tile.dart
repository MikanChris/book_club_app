import 'package:flutter/material.dart';
import '../../models/book.dart';

class BookCoverTile extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;
  const BookCoverTile({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 110,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 2/3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  book.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              book.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

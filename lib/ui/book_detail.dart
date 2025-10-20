import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/book.dart';
import '../state/book_cubit.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;
  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Detail'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: cubit.backToList, //back button
        ),
        actions: const [Icon(Icons.info_outline)],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 3/4,
              child: Image.asset(book.imageUrl, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 16),
          Text(book.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(
            book.author,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.grey[700]),
          ),
          const SizedBox(height: 12),
          Text(book.description),
        ],
      ),
    );
  }
}

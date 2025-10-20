import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/book_cubit.dart';
import 'widgets/book_cover_tile.dart';
import 'book_detail.dart';

class BookHome extends StatelessWidget {
  const BookHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        if (state.loading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state.view == ViewMode.detail && state.selected != null) {
          return BookDetailPage(book: state.selected!);
        }

        final cubit = context.read<BookCubit>();

        return Scaffold(
          appBar: AppBar(
            title: const Text('Book Club Home'),
            leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
            actions: const [Icon(Icons.info_outline)],
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Sort by  '),
                    FilterChip(
                      label: const Text('Author'),
                      selected: state.sortMode == SortMode.author,
                      onSelected: (_) => cubit.sortBy(SortMode.author),
                    ),
                    const SizedBox(width: 8),
                    FilterChip(
                      label: const Text('Title'),
                      selected: state.sortMode == SortMode.title,
                      onSelected: (_) => cubit.sortBy(SortMode.title),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('Books',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),

                SizedBox(
                  height: 210,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.books.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, i) {
                      final b = state.books[i];
                      return BookCoverTile(
                        book: b,
                        onTap: () => cubit.selectBook(b),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

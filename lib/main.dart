import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state/book_cubit.dart';
import 'ui/book_home.dart';

void main() {
  runApp(const BookClubApp());
}

class BookClubApp extends StatelessWidget {
  const BookClubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookCubit(),
      child: MaterialApp(
        title: 'Book Club',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: const Color(0xFFB39DDB),
          useMaterial3: true,
        ),
        home: const BookHome(),
      ),
    );
  }
}

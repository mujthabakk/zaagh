import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: const Text('song title'),
            leading: Card(
              child: Image.asset('assets/image/zaagh.png'),
            ),
          ),
        ),
      ),
    );
  }
}

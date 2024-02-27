import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final VoidCallback? onPressed;
  const SearchField({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8 * 2),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              8 * 2,
            ),
          ),
          hintText: 'search',
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8 * 3.5,
            vertical: 8 * 2,
          ),
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.search,
            ),
          ),
        ),
      ),
    );
  }
}

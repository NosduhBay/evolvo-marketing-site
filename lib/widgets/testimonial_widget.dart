import 'package:flutter/material.dart';

class TestimonialWidget extends StatelessWidget {
  final String testimonial;
  final String author;

  const TestimonialWidget({
    super.key,
    required this.testimonial,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 4,
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Text('"$testimonial" - $author', textAlign: TextAlign.center, style: const TextStyle(fontStyle: FontStyle.italic)),
    );
  }
}
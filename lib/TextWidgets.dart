import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  
  const TextTitle(this.heading);
  final String heading;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          heading,
          style: const TextStyle(fontSize: 24),
        ),
      );
}

class TextSlogan extends StatelessWidget {
  const TextSlogan(this.content);
  final String content;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          content,
          style: const TextStyle(fontSize: 18),
        ),
      );
}

class TextHq extends StatelessWidget {
  const TextHq(this.hq);
  final String hq;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Text(
          hq,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      );
}
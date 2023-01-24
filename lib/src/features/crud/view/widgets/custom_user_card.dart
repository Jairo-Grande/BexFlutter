import 'package:flutter/material.dart';

class CustomUserCard extends StatelessWidget {
  const CustomUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
        child: Column(
      children: [
        Text(
          "data",
          style: theme.textTheme.bodyMedium,
        ),
        Text("data")
      ],
    ));
  }
}

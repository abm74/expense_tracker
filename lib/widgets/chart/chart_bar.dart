import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double fill;
  const ChartBar({super.key, required this.fill});
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return FractionallySizedBox(
      alignment: Alignment.bottomCenter,
      heightFactor: fill,
      widthFactor: 0.9,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          color: Theme.of(context).colorScheme.primary,
        ),
        // constraints: const BoxConstraints(minWidth: 30, maxWidth: 70),
        // width: 75,
      ),
    );
    
  }
}

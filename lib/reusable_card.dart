import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class reusable_card extends StatelessWidget {
  const reusable_card(
      {required this.colors, required this.card_child, required this.Ontap});
  final Color colors;
  final Widget card_child;
  final Function Ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Ontap(),
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(10),
        ),
        child: card_child,
      ),
    );
  }
}

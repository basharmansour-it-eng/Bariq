import 'package:bariq/core/constant/const.dart';
import 'package:flutter/material.dart';


/// بطاقة بيضاء تجمع عناصر MenuTile وتفصل بينها بخطوط رفيعة تلقائياً.
class MenuCard extends StatelessWidget {
  final List<Widget> children;

  const MenuCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      items.add(children[i]);
      if (i != children.length - 1) {
        items.add(Divider(
          height: 1,
          indent: 64,
          color: lightCyan.withValues(alpha: 0.35),
        ));
      }
    }

    return Material(
      color: whiteColor,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: Column(children: items),
    );
  }
}
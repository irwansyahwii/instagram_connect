import 'package:flutter/widgets.dart';

class NumAndTextColumn extends StatelessWidget {
  final int amount;
  final String unitName;

  const NumAndTextColumn({super.key, 
    required this.amount,
    required this.unitName
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('$amount', style: const TextStyle(fontWeight: FontWeight.bold),),
      Text(unitName, style: const TextStyle(fontSize: 14),)
    ],);
  }

}
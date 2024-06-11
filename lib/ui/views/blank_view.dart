import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_label.dart';
import 'package:flutter/material.dart';

class BlankView extends StatelessWidget {
  const BlankView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Blanck View', style: CustomLabel.h1),

          SizedBox(height: 10)

          WhiteCard(
            title: 'Blank Page',
            child: Text('Hola Mundo!!')
          )
          
        ],
      ),
    );
  }
}
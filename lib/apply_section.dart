import 'package:flutter/material.dart';

class OnlineApply extends StatelessWidget {
  const OnlineApply({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xfffc5e05),
      ),
      child: const Center(child: Text("UP Aganwadi 2024 Apply \n Online" , textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20),)),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_ui/view_models/exam_view_model.dart';

class CategoryUpdateSection extends StatelessWidget {
  CategoryUpdateSection({super.key});

  final List<Color> buttonColors = [
    Colors.indigo,
    Colors.orange[800]!,
    Color(0xffaa183d),
    Colors.deepOrange,
    Colors.green[700]!,
    Color(0xffff36ff),
    Colors.blue,
    Colors.redAccent,
  ];

  @override
  Widget build(BuildContext context) {
    final examViewModel = Provider.of<ExamViewModel>(context);

    return Container(
      margin: const EdgeInsets.all(15),
      height: 50, // Fixed height for the row
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Enable horizontal scrolling
        itemCount: examViewModel.categories.length,
        itemBuilder: (context, index) {
          final category = examViewModel.categories[index];
          final String categoryName = category["name"] ?? "Unknown";
          final Color categoryColor = buttonColors[index % buttonColors.length];

          return Container(
            margin: const EdgeInsets.symmetric(
                horizontal: 5), // Adds spacing between items
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: categoryColor,
            ),
            child: Center(
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          );
        },
      ),
    );
  }
}

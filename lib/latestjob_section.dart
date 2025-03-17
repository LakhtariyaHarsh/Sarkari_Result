import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_ui/admitcard.dart';
import 'package:second_ui/answerkey.dart';
import 'package:second_ui/jobinformation.dart';
import 'package:second_ui/result.dart';
import 'package:second_ui/view_models/exam_view_model.dart';
import 'view_more.dart';

// ignore: must_be_immutable
class ResultAndLatestJobsSection extends StatelessWidget {
  ResultAndLatestJobsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final examViewModel = Provider.of<ExamViewModel>(context);
    return Container(
      margin: EdgeInsets.only(top: 7),
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Latest Jobs Column
            ExamSection(
              title: "Latest Jobs",
              exams: examViewModel.examList,
              color: Color(0xffaa183d),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewMore(),
                  ),
                );
              },
            ),

            ExamSection(
              title: "Result",
              exams: examViewModel.resultExamList,
              color: Color(0xff3c6626),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(),
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        // second dynamic data
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Latest Jobs Column
            ExamSection(
              title: "Admit Card",
              exams: examViewModel.admitCardExamList,
              color: Color(0xff3c6626),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Admitcard(),
                  ),
                );
              },
            ),

            ExamSection(
              title: "Answer Key",
              exams: examViewModel.answerKeyExamList,
              color: Color(0xffaa183d),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Answerkey(),
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}

class ExamSection extends StatelessWidget {
  final String title;
  final List<Map<String, String>> exams;
  final Color color;
  final VoidCallback onPressed;

  ExamSection(
      {required this.title,
      required this.exams,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 2.5, right: 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: exams.length,
              itemBuilder: (BuildContext context, int index) {
                // String examId = exams[index]["id"] ?? "";
                // String examName = exams[index]["name"] ?? "";
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Row(
                    children: [
                      Icon(Icons.circle, size: 9, color: color),
                      SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          exams[index]["name"]!,
                          style: TextStyle(fontSize: 14),
                          overflow:
                              TextOverflow.ellipsis, // Avoid text overflow
                          maxLines: 5,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Jobinformation(
                            examId: exams[index]
                                ["id"]!), // Pass examId to JobInformation
                      ),
                    );
                  },
                );
              },
            ),
            Align(
              alignment: Alignment.center,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: BorderSide(
                    color: Color(0xffaa183d),
                  ),
                ),
                onPressed: onPressed,
                child: const Text(
                  "View More",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

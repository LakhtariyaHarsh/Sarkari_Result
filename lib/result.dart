import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:second_ui/jobinformation.dart';
import 'package:second_ui/view_models/exam_view_model.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  void initState() {
    super.initState();
    // Fetch data when the screen is initialized
    Future.microtask(
        () => Provider.of<ExamViewModel>(context, listen: false).fetchExamsByResult());
  }

  @override
  Widget build(BuildContext context) {
    final examViewModel = Provider.of<ExamViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(0xffaa183d),
        title: const Text(
          "Result",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: const Color(0xfff3f3f3),
        child: examViewModel.isLoading
            ? Center(
                child: SpinKitFadingCircle(
                  color: Colors.blue, // Change color as needed
                  size: 50.0,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    ...examViewModel.resultExamList.map((exam) => InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  Jobinformation(examId: exam['id']!,)),
                          ),
                          child: Card(
                            color: Color.fromARGB(255, 218, 229, 246),
                            child: ListTile(
                              leading: const Icon(Icons.circle,
                                  size: 15, color: Colors.black54),
                              title: Text(
                                exam['name']!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
      ),
    );
  }
}

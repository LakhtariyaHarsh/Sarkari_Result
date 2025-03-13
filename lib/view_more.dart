import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:second_ui/view_models/exam_view_model.dart';
import 'jobinformation.dart';

class ViewMore extends StatefulWidget {
  const ViewMore({super.key});

  @override
  State<ViewMore> createState() => _ViewMoreState();
}

class _ViewMoreState extends State<ViewMore> {
  @override
  void initState() {
    super.initState();
    // Fetch data when the screen is initialized
    Future.microtask(
        () => Provider.of<ExamViewModel>(context, listen: false).fetchExams());
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
          "Latest Jobs",
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
                    ...examViewModel.examList.map((exam) => InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Jobinformation()),
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

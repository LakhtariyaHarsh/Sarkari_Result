import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:second_ui/jobinformation.dart';
import 'package:second_ui/view_models/exam_view_model.dart';

class Answerkey extends StatefulWidget {
  const Answerkey({super.key});

  @override
  State<Answerkey> createState() => _AnswerkeyState();
}

class _AnswerkeyState extends State<Answerkey> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ExamViewModel>(context, listen: false).fetchExamsByAnswerKey();
    });
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final examViewModel = Provider.of<ExamViewModel>(context, listen: false);
    
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !examViewModel.isLoadingMore &&
        examViewModel.page < examViewModel.totalPages) {
      examViewModel.page++;
      examViewModel.fetchExamsByAnswerKey(isLoadMore: true);
    }
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
          "Answer Key",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: const Color(0xfff3f3f3),
        child: examViewModel.isLoading
            ? const Center(
                child: SpinKitFadingCircle(
                  color: Colors.blue,
                  size: 50.0,
                ),
              )
            : ListView.builder(
                controller: _scrollController,
                itemCount: examViewModel.answerKeyExamList.length + 1,
                itemBuilder: (context, index) {
                  if (index < examViewModel.answerKeyExamList.length) {
                    final exam = examViewModel.answerKeyExamList[index];
                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Jobinformation(
                            examId: exam['id']!,
                          ),
                        ),
                      ),
                      child: Card(
                        color: const Color.fromARGB(255, 218, 229, 246),
                        child: ListTile(
                          leading: const Icon(Icons.circle,
                              size: 15, color: Colors.black54),
                          title: Text(
                            exam['name']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  } else if (examViewModel.isLoadingMore) {
                    return const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: SpinKitFadingCircle(
                          color: Colors.blue,
                          size: 40.0,
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
      ),
    );
  }
}

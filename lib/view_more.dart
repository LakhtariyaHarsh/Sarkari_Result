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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ExamViewModel>(context, listen: false).fetchExams();
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
      examViewModel.fetchExams(isLoadMore: true);
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
          "Latest Jobs",
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
                itemCount: examViewModel.examList.length + 1, // Extra item for loading
                itemBuilder: (context, index) {
                  if (index < examViewModel.examList.length) {
                    final exam = examViewModel.examList[index];
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

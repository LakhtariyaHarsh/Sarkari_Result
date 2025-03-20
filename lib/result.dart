import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:second_ui/jobinformation.dart';
import 'package:second_ui/services/api_service.dart';
import 'package:second_ui/view_models/exam_view_model.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  final ApiService _apiService = ApiService();
  List<Map<String, String>> examList = []; // Stores fetched exams
  bool isLoading = true;
  bool isLoadingMore = false;
  int page = 1; // Current page
  int limit = 15; // Exams per page
  int totalPages = 1; // Total pages from API
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchExams();
    _scrollController.addListener(_scrollListener);
  }

  // Fetch Exams with Pagination (Store ID & Name)
  Future<void> fetchExams({bool isLoadMore = false}) async {
    if (isLoadMore && (isLoadingMore || page > totalPages)) return;

    try {
      if (isLoadMore) {
        setState(() => isLoadingMore = true);
      } else {
        setState(() => isLoading = true);
      }

      Map<String, dynamic> data =
          await _apiService.getExamsByResult(page, limit);

      setState(() {
        // Store exams as a list of maps (id & name)
        examList.addAll(data["exams"].map<Map<String, String>>((exam) {
          return {
            "id": exam["_id"]?.toString() ?? "Unknown ID",
            "name": exam["name"]?.toString() ?? "No Name Available",
          };
        }).toList());

        totalPages = data["totalPages"]; // Update total pages
        isLoading = false;
        isLoadingMore = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        isLoadingMore = false;
      });
      print("Error fetching exams: $e");
    }
  }

  // Scroll Listener to Detect When User Reaches Bottom
  void _scrollListener() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !isLoadingMore) {
      if (page < totalPages) {
        page++; // Increment page
        fetchExams(isLoadMore: true);
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
            ? const Center(
                child: SpinKitFadingCircle(
                  color: Colors.blue,
                  size: 50.0,
                ),
              )
            : ListView.builder(
                controller: _scrollController,
                itemCount: examList.length + 1, // Extra item for loading
                itemBuilder: (context, index) {
                  if (index < examList.length) {
                    final exam = examList[index];
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
                        color: Colors.redAccent.withOpacity(0.8),
                        child: ListTile(
                          leading: const Icon(Icons.circle,
                              size: 15, color: Colors.white),
                          title: Text(
                            exam['name']!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  } else if (isLoadingMore) {
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

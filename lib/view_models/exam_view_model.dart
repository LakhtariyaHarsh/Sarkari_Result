import 'package:flutter/material.dart';
import 'package:second_ui/services/api_service.dart';

class ExamViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Map<String, String>> examList = [];
  List<Map<String, String>> buttonData = [];
  List<Map<String, String>> admitCardExamList = [];
  List<Map<String, String>> resultExamList = [];
  List<Map<String, String>> answerKeyExamList = [];
  List<Map<String, String>> syllabusExamList = [];
  List<Map<String, String>> CertificateVerificationExamList = [];
  List<Map<String, String>> importantExamList = [];

  List<Map<String, String>> categories = [];

  Map<String, dynamic>? selectedExam; // Holds the fetched exam details

  bool isLoading = false;
  int page = 1;
  int limit = 10;
  int totalPages = 1;

  ExamViewModel() {
    fetchAllData();
  }

  Future<void> fetchAllData() async {
    await fetchExams();
    await fetchExamDataByLastdate();
    await fetchExamsByAdmitCard();
    await fetchExamsByResult();
    await fetchExamsByAnswerKey();
    await fetchExamsBySyllabus();
    await fetchExamsByCertificateVerification();
    await fetchExamsByImportant();
    await fetchCategories();
  }

  Future<void> fetchExams() async {
    _setLoading(true);
    try {
      var data = await _apiService.getExams(page, limit);
      examList = data["exams"].map<Map<String, String>>((exam) {
        return {
          "id": exam["_id"].toString(),
          "name": exam["name"].toString(),
        };
      }).toList();
      totalPages = data["totalPages"];
    } catch (e) {
      print("Error fetching exams: $e");
    }
    _setLoading(false);
  }

  Future<void> fetchExamDataByLastdate() async {
    _setLoading(true);
    try {
      var data = await _apiService.getExamsByLastDateToApply(page, 9);
      buttonData = data["exams"].map<Map<String, String>>((exam) {
        return {
          "id": exam["_id"].toString(),
          "name": exam["name"].toString(),
        };
      }).toList();
      totalPages = data["totalPages"];
    } catch (e) {
      print("Error fetching exams by last date: $e");
    }
    _setLoading(false);
  }

  Future<void> fetchExamsByAdmitCard() async {
    _setLoading(true);
    try {
      var data = await _apiService.getExamsByAdmitCard(page, limit);
      admitCardExamList = data["exams"].map<Map<String, String>>((exam) {
        return {
          "id": exam["_id"].toString(),
          "name": exam["name"].toString(),
        };
      }).toList();
      totalPages = data["totalPages"];
    } catch (e) {
      print("Error fetching exams by admit card: $e");
    }
    _setLoading(false);
  }

  Future<void> fetchExamsByResult() async {
    _setLoading(true);
    try {
      var data = await _apiService.getExamsByResult(page, limit);
      resultExamList = data["exams"].map<Map<String, String>>((exam) {
        return {
          "id": exam["_id"].toString(),
          "name": exam["name"].toString(),
        };
      }).toList();
      totalPages = data["totalPages"];
    } catch (e) {
      print("Error fetching exams by result: $e");
    }
    _setLoading(false);
  }

  Future<void> fetchExamsByAnswerKey() async {
    _setLoading(true);
    try {
      var data = await _apiService.getExamsByAnswerKey(page, limit);
      answerKeyExamList = data["exams"].map<Map<String, String>>((exam) {
        return {
          "id": exam["_id"].toString(),
          "name": exam["name"].toString(),
        };
      }).toList();
      totalPages = data["totalPages"];
    } catch (e) {
      print("Error fetching exams by answer key: $e");
    }
    _setLoading(false);
  }

  Future<void> fetchExamsBySyllabus() async {
    _setLoading(true);
    try {
      var data = await _apiService.getExamsBySyllabus(page, limit);
      syllabusExamList = data["exams"].map<Map<String, String>>((exam) {
        return {
          "id": exam["_id"].toString(),
          "name": exam["name"].toString(),
        };
      }).toList();
      totalPages = data["totalPages"];
    } catch (e) {
      print("Error fetching exams by syllabus: $e");
    }
    _setLoading(false);
  }

  Future<void> fetchExamsByCertificateVerification() async {
    _setLoading(true);
    try {
      var data =
          await _apiService.getExamsByCertificateVerification(page, limit);
      CertificateVerificationExamList =
          data["exams"].map<Map<String, String>>((exam) {
        return {
          "id": exam["_id"].toString(),
          "name": exam["name"].toString(),
        };
      }).toList();
      totalPages = data["totalPages"];
    } catch (e) {
      print("Error fetching exams by CertificateVerification: $e");
    }
    _setLoading(false);
  }

  Future<void> fetchExamsByImportant() async {
    _setLoading(true);
    try {
      var data = await _apiService.getExamsByImportant(page, limit);
      importantExamList = data["exams"].map<Map<String, String>>((exam) {
        return {
          "id": exam["_id"].toString(),
          "name": exam["name"].toString(),
        };
      }).toList();
      totalPages = data["totalPages"];
    } catch (e) {
      print("Error fetching exams by Important: $e");
    }
    _setLoading(false);
  }

  Future<void> fetchCategories({bool isLoadMore = false}) async {
    _setLoading(true);
    try {
      var data = await _apiService.getCategories();
       categories =
          data["categories"].map<Map<String, String>>((category) {
        return {
          "id": category["_id"].toString(),
          "name": category["categoryName"].toString(),
        };
      }).toList();

      totalPages = data["totalPages"];
    } catch (e) {
      print("Error fetching categories: $e");
    }
    _setLoading(false);
  }

  // New method to fetch single exam by ID
  Future<void> fetchExamById(String id) async {
    _setLoading(true);
    try {
      var data = await _apiService.getExamById(id);
      selectedExam = data; // Store the exam data
    } catch (e) {
      print("Error fetching exam by ID: $e");
      selectedExam = null;
    }
    _setLoading(false);
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}

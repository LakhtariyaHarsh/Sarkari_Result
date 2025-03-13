
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final Dio _dio = Dio(
  BaseOptions(
    baseUrl: "http://10.0.2.2:4000/api",  // Use this for Android Emulator
    connectTimeout: Duration(seconds: 10),
    receiveTimeout: Duration(seconds: 10),
  ),
);


  // Add Authorization Token to Headers
  Future<Dio> getDioWithAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    _dio.options.headers["Authorization"] =
        token != null ? "Bearer $token" : null;
    return _dio;
  }

  // Handle API Response
  Map<String, dynamic> _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Failed to load data: ${response.statusMessage}");
    }
  }

  // Login API Call
  Future<Response> login(String email, String password) async {
    try {
      Response response = await _dio
          .post("/users/login", data: {"email": email, "password": password});
      return response;
    } catch (e) {
      print("Login Error: $e");
      throw Exception("Login failed: $e");
    }
  }

  // Register API Call
  Future<Response> register(String name, String email, String password) async {
    try {
      Response response = await _dio.post("/users/register",
          data: {"name": name, "email": email, "password": password});
      return response;
    } catch (e) {
      print("Registration Error: $e");
      throw Exception("Registration failed: $e");
    }
  }

  // Fetch Categories
  Future<Map<String, dynamic>> getCategories() async {
    try {
      Response response = await _dio.get("/categories");
      return _handleResponse(response);
    } catch (e) {
      print("Get Categories Error: $e");
      throw Exception("Failed to load categories: $e");
    }
  }

  // Fetch Exams with Pagination
  Future<Map<String, dynamic>> getExams(int page, int limit) async {
    return _fetchExams("/exams", page, limit);
  }

  // Fetch exams with last date for available form (sorted by lastDateToApply)
  Future<Map<String, dynamic>> getExamsByLastDateToApply(
      int page, int limit) async {
    return _fetchExams(
        "/exams/lastDateToApply", page, limit, {"sort": "lastDateToApply"});
  }

  // Fetch exams with CertificateVerification available (sorted by CertificateVerification date)
  Future<Map<String, dynamic>> getExamsByCertificateVerification(int page, int limit) async {
    return _fetchExams("/exams/certificateVerification", page, limit,
        {"iscertificateVerificationAvailable": true, "sort": "certificateVerificationAvailable"});
  }

  // Fetch exams with Important available (sorted by Important date)
  Future<Map<String, dynamic>> getExamsByImportant(int page, int limit) async {
    return _fetchExams("/exams/important", page, limit,
        {"isImportant": true, "sort": "important"});
  }

  // Fetch exams with admit card available (sorted by admitCardAvailable date)
  Future<Map<String, dynamic>> getExamsByAdmitCard(int page, int limit) async {
    return _fetchExams("/exams/admit-card", page, limit,
        {"isadmitCardAvailable": true, "sort": "admitCardAvailable"});
  }

  // Fetch exams with result available (sorted by resultPostingDate)
  Future<Map<String, dynamic>> getExamsByResult(int page, int limit) async {
    return _fetchExams("/exams/result", page, limit,
        {"resultAvailable": true, "sort": "resultPostingDate"});
  }

  // Fetch exams with syllabus available (sorted by syllabusAvailableDate)
  Future<Map<String, dynamic>> getExamsBySyllabus(int page, int limit) async {
    return _fetchExams("/exams/syllabus", page, limit,
        {"syllabusAvailable": true, "sort": "syllabusAvailableDate"});
  }

  // Fetch exams with answer key available (sorted by answerKeyAvailable date)
  Future<Map<String, dynamic>> getExamsByAnswerKey(int page, int limit) async {
    return _fetchExams("/exams/answerkey", page, limit,
        {"isanswerKeyAvailable": true, "sort": "answerKeyAvailable"});
  }

 // Fetch Exams Helper Method (Returns Full Exam Data)
Future<Map<String, dynamic>> _fetchExams(String endpoint, int page, int limit,
    [Map<String, dynamic>? additionalParams]) async {
  try {
    Map<String, dynamic> queryParams = {"page": page, "limit": limit};
    if (additionalParams != null) {
      queryParams.addAll(additionalParams);
    }

    Response response =
        await _dio.get(endpoint, queryParameters: queryParams);
    
    return {
      "exams": List<Map<String, dynamic>>.from(response.data["exams"]), // Ensure correct type
      "totalPages": response.data["totalPages"]
    };
  } catch (e) {
    print("Fetch Exams Error: $e");
    throw Exception("Failed to load exams: $e");
  }
}

  // Fetch a single exam by ID
  Future<Map<String, dynamic>> getExamById(String examId) async {
    try {
      Response response = await _dio.get("/exams/exambyid/$examId");
      return _handleResponse(response);
    } catch (e) {
      print("Fetch Exam by ID Error: $e");
      throw Exception("Failed to load exam details: $e");
    }
  }

  // Fetch Eligibility Criteria
  Future<Map<String, dynamic>> getEligibility() async {
    try {
      Response response = await _dio.get("/eligibility");
      return _handleResponse(response);
    } catch (e) {
      print("Get Eligibility Error: $e");
      throw Exception("Failed to load eligibility criteria: $e");
    }
  }

  // Fetch Posts
  Future<Map<String, dynamic>> getPosts() async {
    try {
      Response response = await _dio.get("/posts");
      return _handleResponse(response);
    } catch (e) {
      print("Get Posts Error: $e");
      throw Exception("Failed to load posts: $e");
    }
  }
}

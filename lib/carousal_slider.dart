import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:second_ui/jobinformation.dart';
import 'package:second_ui/view_models/exam_view_model.dart';

class CarouselWithButtonOverlay extends StatefulWidget {
  final List<Map<String, String>> displayedExams;
  const CarouselWithButtonOverlay({super.key, required this.displayedExams});

  @override
  _CarouselWithButtonOverlay createState() => _CarouselWithButtonOverlay();
}

class _CarouselWithButtonOverlay extends State<CarouselWithButtonOverlay> {
  int _currentIndex = 0;

  final List<String> imageUrls = [
    "assets/Project.png",
    "assets/admission_icon.png",
    "assets/admit_card_icon.png",
    "assets/result.png",
    "assets/admission_icon.png",
    "assets/admit_card_icon.png",
    "assets/result.png",
    "assets/admission_icon.png",
    "assets/admit_card_icon.png",
  ];

  final List<LinearGradient> gradients = [
    LinearGradient(colors: [Color(0xff6a11cb), Color(0xff2575fc)]),
    LinearGradient(colors: [Color(0xfffc4a1a), Color(0xfff7b733)]),
    LinearGradient(colors: [Color(0xff34e89e), Color(0xff0f3443)]),
    LinearGradient(colors: [Color(0xffee0979), Color(0xffff6a00)]),
    LinearGradient(colors: [Color(0xff667eea), Color(0xff764ba2)]),
    LinearGradient(colors: [Color(0xff00b09b), Color(0xff96c93d)]),
    LinearGradient(colors: [Color(0xffff758c), Color(0xffff7eb3)]),
    LinearGradient(colors: [Color(0xff12c2e9), Color(0xffc471ed), Color(0xfff64f59)]),
    LinearGradient(colors: [Color(0xfffdfc47), Color(0xff24fe41)]),
  ];

  @override
  Widget build(BuildContext context) {
    final examViewModel = Provider.of<ExamViewModel>(context);

    return Scaffold(
      body: Container(
        color: Color(0xfff1f6fc),
        child: examViewModel.isLoading
            ? Center(
                child: SpinKitFadingCircle(
                  color: Colors.blue,
                  size: 50.0,
                ),
              )
            : (examViewModel.buttonData.isEmpty)
                ? Center(
                    child: Text(
                      "No data available",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  )
                : Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount: imageUrls.length,
                        itemBuilder: (BuildContext context, int index, int realIndex) {
                          try {
                            bool isValidIndex = index < widget.displayedExams.length;
                            String buttonText = isValidIndex
                                ? widget.displayedExams[index]['name'] ?? "Unknown"
                                : "Placeholder";

                            String examId = isValidIndex
                                ? widget.displayedExams[index]['id'] ?? "Placeholder"
                                : "Placeholder";

                            bool isDisabled = examId == "Placeholder";

                            return Card(
                              elevation: 4,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: gradients[index % gradients.length],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Image.asset(
                                          imageUrls[index],
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Icon(Icons.image_not_supported, size: 100, color: Colors.grey);
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 12),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            AutoSizeText(
                                              buttonText,
                                              style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                              maxLines: 2,
                                              minFontSize: 10,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 5),
                                            ElevatedButton(
                                              onPressed: isDisabled
                                                  ? null
                                                  : () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => Jobinformation(
                                                            examId: examId,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                backgroundColor: isDisabled ? Colors.grey : Colors.white,
                                              ),
                                              child: Text(
                                                'Read More',
                                                style: TextStyle(
                                                  color: isDisabled ? Colors.black45 : Color(0xffaa183d),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } catch (e) {
                            return Center(
                              child: Text(
                                "Error loading item",
                                style: TextStyle(color: Colors.red),
                              ),
                            );
                          }
                        },
                        options: CarouselOptions(
                          height: 170,
                          enlargeCenterPage: true,
                          viewportFraction: 0.8,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          imageUrls.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == index ? Color(0xffaa183d) : Colors.white,
                              border: Border.all(color: Colors.black54),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}

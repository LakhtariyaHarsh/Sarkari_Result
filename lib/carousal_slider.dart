import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:second_ui/jobinformation.dart';
import 'package:second_ui/view_models/exam_view_model.dart';

class CarouselWithButtonOverlay extends StatefulWidget {
  const CarouselWithButtonOverlay({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
    LinearGradient(
      colors: [Color(0xff6a11cb), Color(0xff2575fc)], // Purple to Blue
    ),
    LinearGradient(
      colors: [Color(0xfffc4a1a), Color(0xfff7b733)], // Orange to Yellow
    ),
    LinearGradient(
      colors: [Color(0xff34e89e), Color(0xff0f3443)], // Green to Dark Blue
    ),
    LinearGradient(
      colors: [Color(0xffee0979), Color(0xffff6a00)], // Pink to Orange
    ),
    LinearGradient(
      colors: [Color(0xff667eea), Color(0xff764ba2)], // Blue to Purple
    ),
    LinearGradient(
      colors: [Color(0xff00b09b), Color(0xff96c93d)], // Teal to Green
    ),
    LinearGradient(
      colors: [Color(0xffff758c), Color(0xffff7eb3)], // Light Red to Pink
    ),
    LinearGradient(
      colors: [
        Color(0xff12c2e9),
        Color(0xffc471ed),
        Color(0xfff64f59)
      ], // Blue to Purple to Red
    ),
    LinearGradient(
      colors: [Color(0xfffdfc47), Color(0xff24fe41)], // Yellow to Green
    ),
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
                  color: Colors.blue, // Change color as needed
                  size: 50.0,
                ),
              )
            : examViewModel.buttonData == null ||
                    examViewModel.buttonData.isEmpty
                ? Center(
                    child: Text(
                      "No data available",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  )
                : Column(
                    children: [
                      // Carousel Slider
                      CarouselSlider.builder(
                        itemCount: imageUrls.length,
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          // Ensure index is within bounds
                          String buttonText =
                              (index < examViewModel.buttonData.length)
                                  ? examViewModel.buttonData[index]['name'] ??
                                      "Unknown"
                                  : "Placeholder";

                          return Card(
                            elevation: 4,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: gradients[index % gradients.length],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  // Background Image
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Image.asset(
                                        imageUrls[index],
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                  ),
                                  // Button & Text
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ConstrainedBox(
                                          constraints:
                                              BoxConstraints(maxWidth: 175),
                                          child: Text(
                                            buttonText,
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    Jobinformation(examId: examViewModel.buttonData[index]['id']!), 
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          child: const Text(
                                            'Read More',
                                            style: TextStyle(
                                                color: Color(0xffaa183d)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
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
                      // Page Indicator
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
                              color: _currentIndex == index
                                  ? Color(0xffaa183d)
                                  : Colors.white,
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

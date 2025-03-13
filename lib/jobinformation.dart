import 'package:flutter/material.dart';

class Jobinformation extends StatefulWidget {
  const Jobinformation({super.key});

  @override
  State<Jobinformation> createState() => _JobinformationState();
}

class _JobinformationState extends State<Jobinformation> {
  String selectedTitle = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Change Drawer icon color
        ),
        backgroundColor: const Color(0xffaa183d),
        title: Text(
          "Sarkari Result Information",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 380),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(),
                      top: BorderSide(),
                      left: BorderSide(),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Ministry of Corporate Affairs (MCA)',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xffff36ff),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Prime Minister PM Internship Scheme 2024',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.green[800],
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'PM Internship PMIS 2024 : Short Details of Notification',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xffff36ff),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'WWW.SARKARIRESULT.COM',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              //2nd column
              Container(
                padding: EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(),
                    top: BorderSide(),
                    left: BorderSide(),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(color: Colors.black, width: 1)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Important Dates',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            RichText(
                                text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: "• Application Begin :",
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                  text: " 12/10/2024",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ])),
                            RichText(
                                text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: "• Last Date for Apply Online :",
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                  text: " As per Schedule",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red)),
                            ])),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: RichText(
                                  text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: "• Complete Form Last Date :",
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                    text: " As per Schedule",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ])),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                'Application Fee',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.green[800],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text('• All Candidates : 0/-',
                                style: TextStyle(fontSize: 14)),
                            Container(
                              margin: EdgeInsets.only(bottom: 17),
                              child: Text(
                                  '• No Application Fee for the All Candidates Only Registered Online.',
                                  style: TextStyle(fontSize: 14)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //3rd column
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 400),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(),
                      top: BorderSide(),
                      left: BorderSide(),
                    ),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: "PM Internship scheme From 2024 :",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: " Age Limit Details 2024",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffff36ff),
                                    fontSize: 18,
                                  )),
                            ])),
                      ),
                      SizedBox(height: 5),
                      RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "• Minimum Age :",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                        TextSpan(
                            text: "  21 Years",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16)),
                        TextSpan(
                            text: "• Maximum Age :",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: "  24 Years",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black)),
                      ])),
                      Text(
                          '• Age Relaxation as per PM Internship Scheme 2024 Rules.',
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
              // 4th column
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 400),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Column(
                    children: [
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: "PM Internship",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffff36ff),
                                  fontSize: 18,
                                )),
                            TextSpan(
                                text: " Scheme Form 2024 :",
                                style: TextStyle(
                                  color: Color(0xffff36ff),
                                  fontSize: 18,
                                )),
                            TextSpan(
                                text: " Total : 125000+ Post",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.green[800],
                                    fontWeight: FontWeight.bold)),
                          ])),
                    ],
                  ),
                ),
              ),

              //5th column
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 400),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(),
                    right: BorderSide(),
                    left: BorderSide(),
                  )),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(),
                            ),
                          ),
                          child: Center(
                            // Center widget centers the child in its parent
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                "Scheme Name",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign
                                    .center, // Center text alignment within the Text widget
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 8,
                          child: Center(
                              child: Text(
                            "PM Internship Eligibility",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )))
                    ],
                  ),
                ),
              ),

              //6th column
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 400),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                    right: BorderSide(),
                    left: BorderSide(),
                  )),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(),
                            ),
                          ),
                          child: Center(
                            // Center widget centers the child in its parent
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                "Prime Minister PM Internship",
                                textAlign: TextAlign
                                    .center, // Center text alignment within the Text widget
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 8,
                          child: Center(
                              child: Column(
                            children: [
                              Text(
                                '• 10th, 12th, ITI, Polytechnic, Diploma OR Graduates',
                                style: TextStyle(fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '• More Eligibility Details Must Read the Notification.',
                                style: TextStyle(fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )))
                    ],
                  ),
                ),
              ),

              //7th column
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 400),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'PM Internship Offers 2024',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xffff36ff),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                          "• Real Life Experience in India's Top Companies (12 Months)",
                          style: TextStyle(fontSize: 16)),
                      Text("• Monthly Assistant Rupees : 5000/-",
                          style: TextStyle(fontSize: 16)),
                      Text('• One Time Grant : Rs : 6000/-',
                          style: TextStyle(fontSize: 16)),
                      Text(
                          '• Insurance Coverage Under PM Jeevan Jyoti Bima Scheme & Pradhan Mantri Suraksha Bima Yojana',
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
              //8th column
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 380),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(),
                      left: BorderSide(),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Interested Candidates Can Read the Full Notification Before Apply Online',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xffff36ff),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              //9th column
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 380),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(),
                      right: BorderSide(),
                      left: BorderSide(),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Download Mobile Apps for the Latest Updates',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.green[800],
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              //10th
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(),
                    top: BorderSide(),
                    left: BorderSide(),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(color: Colors.black, width: 1)),
                        ),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Text(
                              "Android Apps",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: selectedTitle == "Android Apps"
                                      ? Color(0xff591f8d)
                                      : Color(0xff0707ec)),
                            ),
                            onTap: () {
                              setState(() {
                                selectedTitle = "Android Apps";
                              });
                            },
                          ),
                        )),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: InkWell(
                          child: Text(
                            "Apple IOS Apps",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: selectedTitle == "Apple IOS Apps"
                                    ? Color(0xff591f8d)
                                    : Color(0xff0707ec)),
                          ),
                          onTap: () {
                            setState(() {
                              selectedTitle = "Apple IOS Apps";
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //11th
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 400),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(),
                      right: BorderSide(),
                      left: BorderSide(),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Some Useful Important Links',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.green[800],
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              //12th
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(),
                    top: BorderSide(),
                    left: BorderSide(),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(color: Colors.black, width: 1)),
                        ),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Text(
                            "Apply Online (Registration)",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xfffc0afc)),
                          ),
                        )),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: InkWell(
                          child: Text(
                            "Click Here",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: selectedTitle == "Click Here"
                                    ? Color(0xff591f8d)
                                    : Color(0xff0707ec)),
                          ),
                          onTap: () {
                            setState(() {
                              selectedTitle = "Click Here";
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //13th
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(),
                    top: BorderSide(),
                    left: BorderSide(),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(color: Colors.black, width: 1)),
                        ),
                        child: Center(
                            child: Padding(
                          padding:
                              const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                          child: Text(
                            "How to Fill Form (Video Hindi)",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xfffc0afc)),
                          ),
                        )),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: InkWell(
                          child: Text(
                            "Click Here",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: selectedTitle == "Click Here"
                                    ? Color(0xff591f8d)
                                    : Color(0xff0707ec)),
                          ),
                          onTap: () {
                            setState(() {
                              selectedTitle = "Click Here";
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //14th
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(),
                    top: BorderSide(),
                    left: BorderSide(),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(color: Colors.black, width: 1)),
                        ),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Text(
                            "Download User Manual",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xfffc0afc)),
                          ),
                        )),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: Text(
                                "Hindi ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: selectedTitle == "Hindi"
                                        ? Color(0xff591f8d)
                                        : Color(0xff0707ec)),
                              ),
                              onTap: () {
                                setState(() {
                                  selectedTitle = "Hindi";
                                });
                              },
                            ),
                            Text("|"),
                            InkWell(
                              child: Text(
                                " English",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: selectedTitle == "English"
                                        ? Color(0xff591f8d)
                                        : Color(0xff0707ec)),
                              ),
                              onTap: () {
                                setState(() {
                                  selectedTitle = "English";
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //15th
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(),
                    top: BorderSide(),
                    left: BorderSide(),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(color: Colors.black, width: 1)),
                        ),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Text(
                            "Download FAQ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xfffc0afc)),
                          ),
                        )),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: Text(
                                "Hindi ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: selectedTitle == "Hindi"
                                        ? Color(0xff591f8d)
                                        : Color(0xff0707ec)),
                              ),
                              onTap: () {
                                setState(() {
                                  selectedTitle = "Hindi";
                                });
                              },
                            ),
                            Text("|"),
                            InkWell(
                              child: Text(
                                " English",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: selectedTitle == "English"
                                        ? Color(0xff591f8d)
                                        : Color(0xff0707ec)),
                              ),
                              onTap: () {
                                setState(() {
                                  selectedTitle = "English";
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //16th
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(),
                    top: BorderSide(),
                    left: BorderSide(),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(color: Colors.black, width: 1)),
                        ),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Text(
                            "Join Sarkari Result Channel",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xfffc0afc)),
                          ),
                        )),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: Text(
                                "Telegram ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: selectedTitle == "Telegram"
                                        ? Color(0xff591f8d)
                                        : Color(0xff0707ec)),
                              ),
                              onTap: () {
                                setState(() {
                                  selectedTitle = "Telegram";
                                });
                              },
                            ),
                            Text("|"),
                            InkWell(
                              child: Text(
                                " WhatsApp",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: selectedTitle == "WhatsApp"
                                        ? Color(0xff591f8d)
                                        : Color(0xff0707ec)),
                              ),
                              onTap: () {
                                setState(() {
                                  selectedTitle = "WhatsApp";
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //17th
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(),
                    top: BorderSide(),
                    left: BorderSide(),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(color: Colors.black, width: 1)),
                        ),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Text(
                            "Official Website",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xfffc0afc)),
                          ),
                        )),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: InkWell(
                          child: Text(
                            "PMIS Official Website",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: selectedTitle == "PMIS Official Website"
                                    ? Color(0xff591f8d)
                                    : Color(0xff0707ec)),
                          ),
                          onTap: () {
                            setState(() {
                              selectedTitle = "PMIS Official Website";
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //18th
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 400),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    children: [
                      Text(
                        'Some Useful Important Links',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.green[800],
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        child: Text(
                          "Army 10+2 TES 53 Recruitment 2024",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: selectedTitle ==
                                      "Army 10+2 TES 53 Recruitment 2024"
                                  ? Color(0xff591f8d)
                                  : Color(0xff0707ec)),
                        ),
                        onTap: () {
                          setState(() {
                            selectedTitle = "Army 10+2 TES 53 Recruitment 2024";
                          });
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        child: Text(
                          "NFL Non Executives Recruitment 2024",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: selectedTitle ==
                                      "NFL Non Executives Recruitment 2024"
                                  ? Color(0xff591f8d)
                                  : Color(0xff0707ec)),
                        ),
                        onTap: () {
                          setState(() {
                            selectedTitle =
                                "NFL Non Executives Recruitment 2024";
                          });
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        child: Text(
                          "High Security Number Plate HSRP Online Form 2024",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: selectedTitle ==
                                      "High Security Number Plate HSRP Online Form 2024"
                                  ? Color(0xff591f8d)
                                  : Color(0xff0707ec)),
                        ),
                        onTap: () {
                          setState(() {
                            selectedTitle =
                                "High Security Number Plate HSRP Online Form 2024";
                          });
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        child: Text(
                          "UP Learning / Permanent License Online Form 2024",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: selectedTitle ==
                                      "UP Learning / Permanent License Online Form 2024"
                                  ? Color(0xff591f8d)
                                  : Color(0xff0707ec)),
                        ),
                        onTap: () {
                          setState(() {
                            selectedTitle =
                                "UP Learning / Permanent License Online Form 2024";
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

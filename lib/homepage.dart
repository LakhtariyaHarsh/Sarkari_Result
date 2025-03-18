import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_ui/view_models/exam_view_model.dart';
import 'categori_Section.dart';
import 'apply_section.dart';
import 'latestjob_section.dart';
import 'category_update_section.dart';
import 'package:intl/intl.dart';
import 'carousal_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";
  String selectedTitle = "";
  @override
  Widget build(BuildContext context) {
    final examViewModel = Provider.of<ExamViewModel>(context);
    var time = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Change Drawer icon color
        ),
        backgroundColor: const Color(0xffaa183d),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.white, // Set your drawer icon color here
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Text(
          "Sarkari Result",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification icon tap here
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Notification clicked!")),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size(3, 60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 125,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "All Jobs",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ))),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 230,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      controller: _searchController,
                      onChanged: (value) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (value.isEmpty) {
                            examViewModel.clearSearch();
                          } else {
                            examViewModel.searchExams(value);
                          }
                        });
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search For Categories , Jobs,..",
                        hintStyle: TextStyle(fontWeight: FontWeight.w500),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: const Color(0xffe3e4e6),
          child: ListView(
            children: [
              SizedBox(
                height: 200,
                child: DrawerHeader(
                    padding: EdgeInsets.zero,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 244, 245,
                          246), // Set background color for DrawerHeader
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage("assets/logo_drawer.icon.png"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "SARKARI RESULT",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 20),
                              ),
                              Text(
                                DateFormat('dd-MMM-yyyy').format(time),
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
              ListTile(
                leading: ImageIcon(
                  AssetImage('assets/home_18.png'),
                  color: Color(0xffaa183d),
                  size: 35,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                    color: selectedTitle == "Home"
                        ? Color(0xffaa183d)
                        : Colors.black,
                    fontWeight: selectedTitle == "Home"
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedTitle = "Home";
                  });
                },
              ),
              const Divider(),
              ListTile(
                leading: ImageIcon(
                  AssetImage('assets/heart_18.png'),
                  color: Color(0xffaa183d),
                  size: 35,
                ),
                title: Text(
                  "Saved JOb",
                  style: TextStyle(
                    color: selectedTitle == "Saved JOb"
                        ? Color(0xffaa183d)
                        : Colors.black,
                    fontWeight: selectedTitle == "Saved JOb"
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedTitle = "Saved JOb";
                  });
                },
              ),
              const Divider(),
              ListTile(
                leading: Icon(
                  Icons.notification_important_outlined,
                  color: Color(0xffaa183d),
                  size: 35,
                ),
                title: Text(
                  "Notification",
                  style: TextStyle(
                    color: selectedTitle == "Notification"
                        ? Color(0xffaa183d)
                        : Colors.black,
                    fontWeight: selectedTitle == "Notification"
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedTitle = "Notification";
                  });
                },
              ),
              const Divider(),
              ListTile(
                leading: Icon(
                  Icons.share_outlined,
                  color: Color(0xffaa183d),
                  size: 35,
                ),
                title: Text(
                  "Share this App",
                  style: TextStyle(
                    color: selectedTitle == "Share this App"
                        ? Color(0xffaa183d)
                        : Colors.black,
                    fontWeight: selectedTitle == "Share this App"
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedTitle = "Share this App";
                  });
                },
              ),
              const Divider(),
              ListTile(
                leading: Icon(
                  Icons.star_border_outlined,
                  color: Color(0xffaa183d),
                  size: 35,
                ),
                title: Text(
                  "Rate  this App",
                  style: TextStyle(
                    color: selectedTitle == "Rate this App"
                        ? Color(0xffaa183d)
                        : Colors.black,
                    fontWeight: selectedTitle == "Rate this App"
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedTitle = "Rate this App";
                  });
                },
              ),
              const Divider(),
              ListTile(
                leading: ImageIcon(
                  AssetImage('assets/interrogation_18.png'),
                  color: Color(0xffaa183d),
                  size: 35,
                ),
                title: Text(
                  "About",
                  style: TextStyle(
                    color: selectedTitle == "About"
                        ? Color(0xffaa183d)
                        : Colors.black,
                    fontWeight: selectedTitle == "About"
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedTitle = "About";
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Container(
          color: Color(0xfff1f6fc),
          child: Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                color: const Color(0xfff1f1f1),
                child: Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const Text(
                        "Trending",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 230, // Set height as needed
                child: Center(child: CarouselWithButtonOverlay(displayedExams: examViewModel.displayedButtonData)),
              ),
              Container(
                height: 50,
                width: double.infinity,
                color: const Color(0xfff1f1f1),
                child: Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const Text(
                        "Categories",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              CategoriesSection(),
              const SizedBox(
                height: 10,
              ),
              const OnlineApply(),
              Container(
                height: 50,
                width: double.infinity,
                color: const Color(0xfff1f1f1),
                child: Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const Text(
                        "Latest Update",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              ResultAndLatestJobsSection(displayedExams: examViewModel.displayedExams, displayedExamsAdmitcard: examViewModel.displayedadmitCardExamList, displayedExamsAnswerKey: examViewModel.displayedAnswerKeyExamList, displayedExamsResult: examViewModel.displayedResultExamList),
              Container(
                height: 50,
                width: double.infinity,
                color: const Color(0xfff1f1f1),
                child: Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const Text(
                        "Category Wise Update",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              CategoryUpdateSection()
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:courses_task/Core/Images/asset_image_paths.dart';
import 'package:courses_task/Core/Utils/content_manager.dart';
import 'package:courses_task/Models/course_info.dart';
import 'package:courses_task/UI/Home/Widget/course_button.dart';
import 'package:courses_task/UI/CourseDetails/course_details_page.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";

  HomePage({super.key});

  final List<CourseInfo> courseList = [
    CourseInfo("1", "Android Course", AssetImagePaths.androidImage, ContentManager.coursesContent[0]),
    CourseInfo("2", "iOS Course", AssetImagePaths.iosImage, ContentManager.coursesContent[2]),
    CourseInfo("3", "Full Stack Course", AssetImagePaths.fullStackImage, ContentManager.coursesContent[1]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CourseApp"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: courseList.length,
        itemBuilder: (context, index) {
          final course = courseList[index];
          return CourseButton(
            courseInfo: course,
            onTap: () {
              Navigator.pushNamed(
                context,
                CourseDetailsPage.routeName,
                arguments: course,
              );
            },
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
      ),
    );
  }
}


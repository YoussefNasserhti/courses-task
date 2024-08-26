import 'package:flutter/material.dart';
import 'package:courses_task/Models/course_info.dart';
import 'package:courses_task/Core/Images/asset_image_paths.dart';
import 'package:courses_task/Core/Utils/app_colors.dart';

class CourseDetailsPage extends StatefulWidget {
  static const String routeName = "details";

  const CourseDetailsPage({super.key});

  @override
  _CourseDetailsPageState createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  bool _isExpanded = false; // حالة لتحديد إذا كان المحتوى الموسع معروضًا

  @override
  Widget build(BuildContext context) {
    final CourseInfo courseInfo = ModalRoute.of(context)!.settings.arguments as CourseInfo;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          courseInfo.name,
          style: TextStyle(color: Colors.white),
        ),
        titleSpacing: 0,
      ),
      body: Stack(
        children: [
          // صورة الخلفية
          Positioned.fill(
            child: Image.asset(
              AssetImagePaths.backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          // محتوى الدورة
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // عرض صورة الدورة فوق الخلفية
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(courseInfo.imagePath),
                  ),
                ),
                height: 250,
              ),
              const SizedBox(height: 20),
              // عرض المحتوى
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // عرض المحتوى القصير أو الكامل حسب الحالة
                        Text(
                          _isExpanded ? courseInfo.content : courseInfo.content.substring(0, 150) + '...', // العرض الكامل أو مختصر
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(height: 16),
                        // الزر
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isExpanded = !_isExpanded; // تبديل الحالة بين العرض الكامل والمختصر
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            _isExpanded ? 'Show Less' : 'Show More', // تغيير النص بناءً على الحالة
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

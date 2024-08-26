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
  bool _isExpanded = false;

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

          Positioned.fill(
            child: Image.asset(
              AssetImagePaths.backgroundImage,
              fit: BoxFit.cover,
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

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

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          _isExpanded ? courseInfo.content : courseInfo.content.substring(0, 150) + '...',
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(height: 16),

                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isExpanded = !_isExpanded;
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
                            _isExpanded ? 'Show Less' : 'Show More',
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

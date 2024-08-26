import 'package:flutter/material.dart';
import 'package:courses_task/Models/course_info.dart';

class CourseButton extends StatelessWidget {
  final CourseInfo courseInfo;
  final VoidCallback onTap;

  const CourseButton({
    Key? key,
    required this.courseInfo,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch, // يأخذ العرض الكامل
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(courseInfo.imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          height: 150,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            courseInfo.name,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

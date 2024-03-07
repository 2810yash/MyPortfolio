import 'package:flutter/material.dart';

class ProjectUtils {
  final String image;
  final String title;
  final String subTitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subTitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
  });
}

List<ProjectUtils> projects = [
  ProjectUtils(
    image: 'assets/project_images/carbon_fpts.jpg',
    title: "CFC",
    subTitle: "Carbon FootPrint Calculator",
    androidLink: null,
    iosLink: null,
    webLink: "https://carbon-footprints.web.app/",
  ),
  ProjectUtils(
    image: 'assets/project_images/python_project.png',
    title: "Attendance Monitoring System",
    subTitle: "Python, OpenCV",
    androidLink: null,
    iosLink: null,
    webLink: null,
  ),
  ProjectUtils(
    image: 'assets/project_images/prj3.png',
    title: "Logic Gate Implementation",
    subTitle: "Advanced C++",
    androidLink: null,
    iosLink: null,
    webLink: null,
  ),
  ProjectUtils(
    image: 'assets/project_images/prj4.png',
    title: "IOIT-ACM",
    subTitle: "Event management application",
    androidLink: null,
    iosLink: null,
    webLink: null,
  ),
  ProjectUtils(
    image: 'assets/project_images/prj4.png',
    title: "Expense Tracker",
    subTitle: "Weakly Expense tracking application",
    androidLink: null,
    iosLink: null,
    webLink: null,
  ),
];

import 'package:flutter/material.dart';
import 'package:flutter_task/models/category_model.dart';
import 'package:flutter_task/models/course_model.dart';
import 'package:flutter_task/models/tutor_model.dart';
import 'package:flutter_task/services/api_service.dart';
import 'package:flutter_task/shared_components.dart/category_card.dart';
import 'package:flutter_task/shared_components.dart/course_card.dart';
import 'package:flutter_task/shared_components.dart/search_button.dart';
import 'package:flutter_task/shared_components.dart/tutor_avatar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetch();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.hasData) {
          Map<String, dynamic> data = snapshot.data! as Map<String, dynamic>;

          List<CourseModel> popularCourses =
              (data['popular_courses']['data'] as List)
                  .map((i) => CourseModel.fromJson(i))
                  .toList();
          List<CategoryModel> categories = (data['categoies']['data'] as List)
              .map((i) => CategoryModel.fromJson(i))
              .toList();
          List<TutorModel> tutors = (data['tutors']['data'] as List)
              .map((i) => TutorModel.fromJson(i))
              .toList();

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const SearchButton(),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Popular Courses',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popularCourses.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 300,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CourseCard(
                            course: popularCourses[index],
                            isBestSeller: index == 0 ? true : false,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Category',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 18 + .0),
                        child: SizedBox.square(
                          dimension: 100,
                          child: CategoryCard(category: categories[index]),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Top Tutors',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 18 + .0),
                        child: SizedBox.square(
                          dimension: 50,
                          child: TutorAvatar(tutor: tutors[index]),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

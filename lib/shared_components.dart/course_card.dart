import 'package:flutter/material.dart';
import 'package:flutter_task/models/course_model.dart';

class CourseCard extends StatelessWidget {
  final CourseModel course;
  final bool isBestSeller;
  const CourseCard({Key? key, required this.course, this.isBestSeller = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.black12,
      child: Column(
        children: [
          const Expanded(
            flex: 2,
            child: Placeholder(),
          ),
          SizedBox(
            height: 2,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.title,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        maxLines: 1,
                      ),
                      Text(
                        "By ${course.author}",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isBestSeller
                          ? Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFee6a61),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: const Text(
                                  "Bestseller",
                                  style: TextStyle(
                                      fontSize: 9, color: Colors.white),
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                      Text(course.fees.currencySymbol + course.fees.value,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 12,
                        ),
                        SizedBox(
                          width: 1,
                        ),
                        Text(course.rating.avgRating,
                            style: TextStyle(color: Colors.grey, fontSize: 10)),
                        SizedBox(
                          width: 5,
                        ),
                        Text('(' + course.rating.totalGivenBy + ')',
                            style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_task/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(category.image),
            colorFilter: ColorFilter.mode(Colors.pink.shade500.withOpacity(0.5), BlendMode.hardLight),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            category.name,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

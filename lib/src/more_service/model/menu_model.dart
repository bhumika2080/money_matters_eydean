import 'package:flutter/material.dart';

class MenuCategoryModel {
  final String category;
  final List<MenuModel> menus;

  MenuCategoryModel({required this.category, required this.menus});
}

class MenuModel {
  final IconData? icon;
  final String? image;
  final String name;
  final Slug? slug;
  final String? route;
  final dynamic arguments;

  MenuModel({
    this.icon,
    required this.name,
    this.image,
    this.slug,
    this.route,
    this.arguments,
  });
}

enum Slug {
  latest("NEW"),
  updated("UPDATED");

  const Slug(this.name);
  final String name;
}

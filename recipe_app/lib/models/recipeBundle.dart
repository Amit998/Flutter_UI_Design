import 'package:flutter/material.dart';

class RecipeBundle {
  final int id, chefs, recipes;
  final String title, description, imgScr;
  final Color color;

  RecipeBundle(
      {this.id,
      this.chefs,
      this.recipes,
      this.title,
      this.description,
      this.imgScr,
      this.color});
}

List<RecipeBundle> recipeBundle = [
  RecipeBundle(
    id: 1,
    chefs: 16,
    recipes: 95,
    title: "Cook Something New Everyday",
    description: "New And Tasty recipes every minutes",
    imgScr: 'assets/images/cook_new@2x.png',
    color: Color(0xFFD82040),
  ),
  RecipeBundle(
    id: 2,
    chefs: 8,
    recipes: 26,
    title: "Best of 2020",
    description: "Cook recipes for special occasions",
    imgScr: "assets/images/best_2020@2x.png",
    color: Color(0xFF90AF17),
  ),
  RecipeBundle(
    id: 3,
    chefs: 10,
    recipes: 43,
    title: "Food Court",
    description: "What's your favorite food dish make it now",
    imgScr: "assets/images/food_court@2x.png",
    color: Color(0xFF2DBBD8),
  ),
];

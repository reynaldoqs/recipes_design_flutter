import 'package:flutter/material.dart';
import 'package:naldo_design_receta/theme/Colors.dart';
class Recipe {
  final String id;
  final String name;
  final String type;
  final int favorite;
  final String description;
  final String urlImg;
  final List<String> tags;
  final Chef chef;
  Recipe(
      {this.id,
        this.name,
      this.type,
      this.favorite,
      this.chef,
      this.description,
      this.urlImg,
      this.tags});
  static List<Widget> buildFavorites({int favorites}) {
    return List.generate(
      5,
          (int index) => Icon(
        (index >= favorites ? Icons.favorite_border : Icons.favorite),
        color: RecipeColors.yellow,
        size: 16,
      ),
    );
  }
}

class Chef {
  final String name;
  final String description;
  final String urlPhoto;
  Chef({this.name, this.description, this.urlPhoto});
}

Chef c1 = new Chef(
    name: 'jakelee',
    description: 'Caviot Head Sous Chef',
    urlPhoto: 'assets/images/user01.jpg');
Chef c2 = new Chef(
    name: 'alicejuan',
    description: 'Caviot Head Sous Chef',
    urlPhoto: 'assets/images/user02.jpg');
Chef c3 = new Chef(
    name: 'Jake Olive',
    description: 'Caviot Head Sous Chef',
    urlPhoto: 'assets/images/user03.jpg');

List<Recipe> recipes = [
  Recipe(
      id: '01',
      name: 'Thai Sesame Rice With Red Cabbage',
      type: 'Starters',
      favorite: 3,
      tags: ['noodle', 'caviar'],
      urlImg: 'assets/images/recipes01.jpg',
      description:
          'Rice dish in which sticky glutinous rice is mixed with all kings of vegetables with sweet pomegranate or ment and steamed.',
      chef: c1),
  Recipe(
      id: '02',
      name: 'Thai Sesame Rice With Red Cabbage',
      type: 'Mainly',
      favorite: 4,
      tags: ['scrambled', 'hoter'],
      urlImg: 'assets/images/recipes02.jpg',
      description:
          'Rice dish in which sticky glutinous rice is mixed with all kings of vegetables with sweet pomegranate or ment and steamed.',
      chef: c2),
  Recipe(
      id: '03',
      name: 'Thai Sesame Rice With Red Cabbage',
      type: 'Starters',
      favorite: 3,
      tags: ['noodle', 'caviar'],
      urlImg: 'assets/images/recipes03.jpg',
      description:
          'Rice dish in which sticky glutinous rice is mixed with all kings of vegetables with sweet pomegranate or ment and steamed.',
      chef: c3),
  Recipe(
      id: '04',
      name: 'Thai Sesame Rice With Red Cabbage',
      type: 'Starters',
      favorite: 3,
      tags: ['noodle', 'caviar'],
      urlImg: 'assets/images/recipes04.jpg',
      description:
          'Rice dish in which sticky glutinous rice is mixed with all kings of vegetables with sweet pomegranate or ment and steamed.',
      chef: c1),
];

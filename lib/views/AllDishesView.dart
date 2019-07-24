import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naldo_design_receta/theme/Styles.dart';
import 'package:naldo_design_receta/models/Recipes.dart';
import 'package:naldo_design_receta/views/RecipeDetail.dart';

class AllDishesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 320,
            child: ListView.builder(
              padding: EdgeInsets.only(
                  left: RecipeStyles.leftPadding,
                  top: RecipeStyles.leftPadding),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return buildMainCard(context: context,recipe: recipes[index]);
              },
              itemCount: recipes.length,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: RecipeStyles.leftPadding, vertical: 10),
            child: Text(
              'Social',
              style: RecipeStyles.largeText,
            ),
          ),
          Container(
            height: 260,
            child: ListView.builder(
              padding: EdgeInsets.only(
                  left: RecipeStyles.leftPadding,
                  top: RecipeStyles.leftPadding),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return buildSecondaryCard(context: context,recipe: recipes[(recipes.length-1) - index]);
              },
              itemCount: recipes.length,
            ),
          )
        ],
      ),
    );
  }

  Container buildSecondaryCard({BuildContext context,Recipe recipe}) {
    return Container(
      width: 210,
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: (){
              Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => RecipeDetail(recipe: recipe,)
              )
              );
            },
            child: Hero(
              tag: 'sec_${recipe.id}',
              child: Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(recipe.urlImg),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black, offset: Offset(4, 4), blurRadius: 20.0)
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 40,
                  width: 40,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(recipe.chef.urlPhoto),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        recipe.chef.name,
                        style: RecipeStyles.normalTextLigth,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        recipe.tags.fold('', (prev, next) => '$prev #$next'),
                        style: RecipeStyles.normalText,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildMainCard({BuildContext context ,Recipe recipe}) {
    return Container(
      width: 270,
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => RecipeDetail(recipe: recipe,))
              );
            },
            child: Container(
              width: double.infinity,
              height: 170,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(recipe.urlImg), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 20.0,
                    )
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  recipe.name,
                  style: RecipeStyles.normalTextLigth,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  recipe.type,
                  style: RecipeStyles.smallText,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(recipe.chef.urlPhoto),
                      ),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children:
                                Recipe.buildFavorites(favorites: recipe.favorite),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            recipe.chef.description,
                            style: RecipeStyles.smallText,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


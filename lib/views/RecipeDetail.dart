import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naldo_design_receta/models/Recipes.dart';
import 'package:naldo_design_receta/theme/Colors.dart';
import 'package:naldo_design_receta/theme/Styles.dart';

class RecipeDetail extends StatelessWidget {
  final Recipe recipe;

  RecipeDetail({Key key, this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RecipeColors.mainBg,
      body: Stack(
        children: <Widget>[
          Hero(
            tag: 'sec_${recipe.id}',
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.8,
              child: Image.asset(
                recipe.urlImg,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(RecipeStyles.leftPadding),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  RecipeColors.mainBg.withOpacity(0.1),
                  RecipeColors.mainBg,
                  RecipeColors.mainBg,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.6, 0.9],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildFavoritePrice(),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      recipe.name,
                      style: RecipeStyles.largeText,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      recipe.type,
                      style: RecipeStyles.smallText,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      recipe.description,
                      style: RecipeStyles.normalText,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    buildAvatar(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'ADD-ONS',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    buildBasil(),
                    SizedBox(
                      height: 30,
                    ),
                    buildbuttom(),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildbuttom() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        onPressed: () {},
        color: RecipeColors.yellow,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)),
        child: Text(
          'ADD TO CART FOR  \u00249',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
              letterSpacing: 1),
        ),
      ),
    );
  }

  Row buildBasil() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Basil Leaves',
                style: RecipeStyles.normalTextLigth,
              ),
              Text(
                'Add some leaves to give a extra flavor',
                style: RecipeStyles.smallText,
              )
            ],
          ),
        ),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(color: RecipeColors.textSecondary),
            shape: BoxShape.circle,
          ),
        )
      ],
    );
  }

  Row buildAvatar() {
    return Row(
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
                recipe.chef.description,
                style: RecipeStyles.normalText,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        )
      ],
    );
  }

  Row buildFavoritePrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Wrap(
          children: Recipe.buildFavorites(favorites: recipe.favorite),
        ),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: RecipeColors.yellow,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "\u0024",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "9",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

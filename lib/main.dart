import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:naldo_design_receta/theme/Colors.dart';
import 'package:naldo_design_receta/theme/Styles.dart';
import 'package:naldo_design_receta/views/AllDishesView.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.amber,
      primaryColor: RecipeColors.mainBg,
    ),
    home: RecipesCont(),
  ));
}

class RecipesCont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RecipeColors.mainBg,
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                floating: true,
                expandedHeight: 130,
                elevation: 0,
                flexibleSpace: buildAppBarArea(),
                bottom: buildTabBar(),
              ),
            ];
          },
          body: TabBarView(
            children: [
              AllDishesView(),
              Container(
                color: Colors.black12,
              ),
              Container(
                color: Colors.orange,
              ),
              Container(
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SafeArea buildAppBarArea() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 35, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Caviar',
              style: RecipeStyles.largerText,
            ),
            SizedBox(height: 4),
            Text(
              'Morden Cuisine Perfected',
              style: RecipeStyles.normalText,
            )
          ],
        ),
      ),
    );
  }

  PreferredSize buildTabBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(75),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: RecipeStyles.leftPadding),
        child: TabBar(
          labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          labelColor: Colors.black,
          unselectedLabelColor: RecipeColors.textPrimary,
          labelPadding: const EdgeInsets.all(1),
          tabs: <Widget>[
            Tab(
              child: Text(
                'All Dishes',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Tab(
              child: Text(
                'Starters',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Tab(
              child: Text(
                'Mains',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Tab(
              child: Text(
                'Deserts',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BubbleTabIndicator(
            indicatorHeight: 28.0,
            indicatorColor: RecipeColors.yellow,
            tabBarIndicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
      ),
    );
  }
}

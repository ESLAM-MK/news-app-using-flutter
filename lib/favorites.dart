import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/CustomListTitle.dart';
import 'package:flutter_application_3/data_provider.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_application_3/providers/favorites_provider.dart';
// import 'package:flutter_application_3/models/article_model.dart';
// import 'package:flutter_application_3/widgets/custom_list_tile.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final favoritesList = favoritesProvider.favoritesList;

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite News"),
        backgroundColor: Colors.green,
      ),
      body: favoritesList.isEmpty
          ? Center(
              child: Text("No favorite news yet"),
            )
          : ListView.builder(
              itemCount: favoritesList.length,
              itemBuilder: (context, index) => customListTile(
                
                favoritesList[index],
                context,
              ),
            ),
    );
  }
}
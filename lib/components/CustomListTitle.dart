import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_3/models/article_model.dart';
// import 'package:flutter_application_3/providers/favorites_provider.dart';
// import 'package:flutter_application_3/pages/article_detailed_page.dart';

import '../data_provider.dart';

Widget customListTile(Article article, BuildContext context) {
  final favoritesProvider = Provider.of<FavoritesProvider>(context);
  bool isFavorite = favoritesProvider.favoritesList.contains(article);

  return Container(
    margin: const EdgeInsets.all(12.0),
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 3.0,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200.0,
          width: double.infinity,
          decoration: BoxDecoration(
            // Let's add the height
            image: DecorationImage(
              image: NetworkImage(article.urlToImage ??
                  'assets/image/360_F_327556002_99c7QmZmwocLwF7ywQ68ChZaBry1DbtD.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                article.source!.name ?? '',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(flex: 4),
            InkWell(
              onTap: () {
                if(isFavorite){
favoritesProvider.removeFavorite(article);
                }
                else{
favoritesProvider.addFavorite(article);

                }

              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: isFavorite ? Colors.red : Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  isFavorite ? "Remove from Favorites" : "Add to Favorites",
                  style: TextStyle(
                    color: isFavorite
                        ? Colors.white
                        : Color.fromARGB(255, 244, 1, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          article.title ?? '',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        )
      ],
    ),
  );
}
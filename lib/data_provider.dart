import 'package:flutter/foundation.dart';
import 'package:flutter_application_3/models/article_model.dart';

class FavoritesProvider extends ChangeNotifier {
  List<Article> _favoritesList = [];

  List<Article> get favoritesList => _favoritesList;

  void addFavorite(Article article) {
    _favoritesList.add(article);
    notifyListeners();
  }

  void removeFavorite(Article article) {
    _favoritesList.remove(article);
    notifyListeners();
  }
}
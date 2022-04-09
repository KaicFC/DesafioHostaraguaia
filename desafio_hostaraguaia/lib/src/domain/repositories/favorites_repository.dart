abstract class IFavoriteRepository {
  Future getFavorites();
  Future addFavorite(int id, String title, String image, String type);
  Future deleteFavorite(int id, String title, String image, String type);
}

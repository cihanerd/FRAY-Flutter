import 'package:fraymobile/models/dashboard/dashboard.dart';
import 'package:fraymobile/models/favorites.dart';
import 'package:fraymobile/provider/servicebase.dart';

class DashboardService extends ServiceBase {
  Future<List<Favorites>> getMyFavorites() async {
    List<Favorites> favorites = [];
    try {
      var response = await dio.get(
        'favorite',
      );
      for (var item in response.data) {
        favorites.add(Favorites.fromJson(item));
      }
    } catch (e) {}
    return favorites;
  }

  Future<DashboardData> getDashboardData() async {
    DashboardData dashboardData = new DashboardData();
    try {
      var response = await dio.get(
        'market/dash',
      );
      dashboardData = DashboardData.fromJson(response.data);
    } catch (e) {
      print(e);
    }
    return dashboardData;
  }
}

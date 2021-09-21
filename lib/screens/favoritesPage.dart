import 'package:flutter/material.dart';
import 'package:fraymobile/models/favorites.dart';
import 'package:fraymobile/provider/dashboardService.dart';
import 'package:fraymobile/screens/companyPage.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: getMyFavorites(),
      builder: (context, AsyncSnapshot<List<Favorites>> snapshot) {
        if (snapshot.hasData) {
          List<Favorites> liste = snapshot.data!;
          return ListView.builder(
            itemCount: liste.length,
            itemBuilder: (context, index) {
              var fav = liste[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompanyPage(fav.code!),
                      ));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  elevation: 5,
                  child: Container(
                    width: size.width * 0.9,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            fav.name ?? "",
                            style: TextStyle(fontSize: 20),
                          ),
                          // Padding(padding: EdgeInsets.only(bottom: 5)),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Container(
                          //       width: size.width * 0.3,
                          //       child: Text(fav.adres ?? ""),
                          //     ),
                          //     Container(
                          //       width: size.width * 0.3,
                          //       child: Text(fav.endeksler ?? ""),
                          //     ),
                          //     Container(
                          //       width: size.width * 0.3,
                          //       child: Text(fav.pazar ?? ""),
                          //     )
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<List<Favorites>> getMyFavorites() async {
    DashboardService ds = DashboardService();
    return ds.getMyFavorites();
  }
}

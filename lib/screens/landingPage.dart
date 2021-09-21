import 'package:flutter/material.dart';
import 'package:fraymobile/models/company/company.dart';
import 'package:fraymobile/models/dashboard/bist_indices.dart';
import 'package:fraymobile/models/dashboard/dashboard.dart';
import 'package:fraymobile/models/dashboard/stock_trade_d.dart';
import 'package:fraymobile/models/favorites.dart';
import 'package:fraymobile/provider/companyService.dart';
import 'package:fraymobile/provider/dashboardService.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  List<Favorites> favorites = [];
  DashboardData? dash;
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: FutureBuilder(
        future: getDashboardData(),
        builder: (context, AsyncSnapshot<DashboardData> snapshot) {
          if (snapshot.hasData) {
            dash = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.only(top: 8, left: 4, right: 4),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: size.width * 0.9,
                          child: TabBar(
                            controller: controller,
                            tabs: [
                              Tab(
                                text: "BIST100",
                              ),
                              Tab(
                                text: "BIST50",
                              ),
                              Tab(
                                text: "BIST30",
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: size.width * 0.9,
                          height: 150,
                          child: TabBarView(
                              controller: controller,
                              children: dash!.bistIndices!
                                  .map((e) => Indices(indices: e))
                                  .toList()),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 16)),
                    Container(
                      width: size.width,
                      child: Text(
                        "En Çok İşlem Görenler",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    StockTrade(
                      stock: dash!.stockTradeM!,
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 16)),
                    Container(
                      width: size.width,
                      child: Text(
                        "En Çok Artanlar",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    StockTrade(
                      stock: dash!.stockTradeI!,
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 16)),
                    Container(
                      width: size.width,
                      child: Text(
                        "En Çok Azalanlar",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    StockTrade(
                      stock: dash!.stockTradeD!,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<List<Company>> getAllCompanies() async {
    CompanyService service = new CompanyService();
    return service.getAllCompanies();
  }

  Future<DashboardData> getDashboardData() {
    DashboardService ds = DashboardService();
    return ds.getDashboardData();
  }

  Future<List<Favorites>> getMyFavorites() {
    DashboardService ds = DashboardService();
    return ds.getMyFavorites();
  }
}

class StockTrade extends StatelessWidget {
  const StockTrade({
    Key? key,
    required this.stock,
  }) : super(key: key);

  final List<StockTradeData> stock;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          sortColumnIndex: 0,
          columnSpacing: MediaQuery.of(context).size.width * 0.088,
          columns: [
            DataColumn(label: Text("Firma")),
            DataColumn(label: Text("Günlük")),
            DataColumn(label: Text("Açılış")),
            DataColumn(label: Text("Son")),
            DataColumn(label: Text("Durum"))
          ],
          rows: stock
              .map((e) => DataRow(cells: [
                    DataCell(
                      Text(e.sembol ?? ""),
                    ),
                    DataCell(Text(e.gunlukyuzde ?? "")),
                    DataCell(Text(e.acilis ?? "")),
                    DataCell(Text(e.son ?? "")),
                    DataCell(Builder(
                      builder: (context) {
                        if (e.simge == "**yukari**") {
                          return Icon(
                            Icons.arrow_upward,
                            color: Colors.green,
                          );
                        } else if (e.simge == "**asagi**") {
                          return Icon(
                            Icons.arrow_downward,
                            color: Colors.red,
                          );
                        } else {
                          return Icon(
                            Icons.stop,
                            color: Colors.blue,
                          );
                        }
                      },
                    ))
                  ]))
              .toList(),
        ),
      ),
    );
  }
}

class Indices extends StatelessWidget {
  const Indices({
    Key? key,
    required this.indices,
  }) : super(key: key);

  final BistIndices? indices;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dünkü Kapanış"),
                Text(indices!.dunkukapanis ?? "")
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Açılış"), Text(indices!.acilis ?? "")],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Son"), Text(indices!.son ?? "")],
            ),
            Divider(),
          ],
        ));
  }
}

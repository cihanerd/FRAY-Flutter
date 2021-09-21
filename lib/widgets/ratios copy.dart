import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fraymobile/models/brief_report/datas.dart';
import 'package:fraymobile/models/brief_report/ratios.dart';
import 'package:fraymobile/provider/companyService.dart';

class Ratios2Widget extends StatefulWidget {
  final String code;
  const Ratios2Widget(this.code, {Key? key}) : super(key: key);

  @override
  _Ratios2WidgetState createState() => _Ratios2WidgetState();
}

class _Ratios2WidgetState extends State<Ratios2Widget>
    with TickerProviderStateMixin {
  TabController? controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: getRatios(widget.code),
      builder: (context, AsyncSnapshot<List<Ratios>> snapshot) {
        if (snapshot.hasData) {
          var ratios = snapshot.data!;
          controller = TabController(length: ratios.length, vsync: this);
          return Container(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: ratios.length * 100,
                    child: TabBar(
                        controller: controller,
                        tabs: ratios
                            .map((e) => Tab(
                                  text: e.title ?? "",
                                ))
                            .toList()),
                  ),
                ),
                Container(
                  width: size.width * 0.9,
                  height: ratios.length * 50,
                  child: TabBarView(
                      controller: controller,
                      children: ratios
                          .toList()
                          .map((e) => RatioWidget(e.title!, e.datas!))
                          .toList()),
                )
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<List<Ratios>> getRatios(String code) {
    CompanyService cs = new CompanyService();
    return cs.getRatios(code);
  }
}

class RatioWidget extends StatefulWidget {
  final List<Datas> datas;
  final String title;
  const RatioWidget(this.title, this.datas, {Key? key}) : super(key: key);

  @override
  _RatioWidgetState createState() => _RatioWidgetState();
}

class _RatioWidgetState extends State<RatioWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: widget.datas.length * 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text("Oran Adı"),
            ),
            DataColumn(label: Text("Formül")),
            DataColumn(label: Text(widget.datas.first.previousPeriod ?? "")),
            DataColumn(label: Text(widget.datas.first.currentPeriod ?? ""))
          ],
          rows: widget.datas.map((e) {
            var currentraw = e.currentPeriodValue;
            var current = "";
            var previousraw = e.previousPeriodValue;
            var previous = "";
            if (currentraw != null) {
              current = currentraw.toString().substring(
                  0, e.currentPeriodValue!.toString().length > 5 ? 5 : null);
            } else {
              current = "";
            }
            if (previousraw != null) {
              previous = previousraw.toString().substring(
                  0, e.previousPeriodValue!.toString().length > 5 ? 5 : null);
            } else {
              previous = "";
            }
            return DataRow(cells: [
              DataCell(Text(e.name ?? "")),
              DataCell(Text(e.formula ?? "")),
              DataCell(Text(previous)),
              DataCell(Text(current))
            ]);
          }).toList(),
        ),
      ),
    );
  }
}

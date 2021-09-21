import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fraymobile/models/brief_report/radar_graphic_model.dart';
import 'package:fraymobile/provider/companyService.dart';

class RadarChartWidget extends StatefulWidget {
  final String code;
  const RadarChartWidget(this.code, {Key? key}) : super(key: key);

  @override
  _RadarChartWidgetState createState() => _RadarChartWidgetState();
}

class _RadarChartWidgetState extends State<RadarChartWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: FutureBuilder(
        future: getCompanyRadar(widget.code),
        builder: (context, AsyncSnapshot<List<RadarGraphicModel>> snapshot) {
          if (snapshot.hasData) {
            final radarData = snapshot.data!;
            final dataSet = new RadarDataSet(
                dataEntries: radarData.map((e) {
                  RadarEntry re = new RadarEntry(value: e.value!);
                  return re;
                }).toList(),
                fillColor: Colors.lightBlue.shade200);
            List<RadarDataSet> datasets = [];
            datasets.add(dataSet);
            RadarChartData data = new RadarChartData(
              dataSets: datasets,
              radarBackgroundColor: Colors.white10,
              borderData: FlBorderData(show: true),
              radarBorderData: const BorderSide(color: Colors.transparent),
              titlePositionPercentageOffset: 0.2,
              titleTextStyle:
                  const TextStyle(color: Colors.white, fontSize: 14),
              getTitle: (index) {
                return radarData[index].title ?? "";
              },
              tickCount: radarData.length,
              ticksTextStyle:
                  const TextStyle(color: Colors.white, fontSize: 10),
              tickBorderData: const BorderSide(
                color: Colors.grey,
              ),
              gridBorderData: const BorderSide(color: Colors.grey, width: 1),
            );
            return AspectRatio(
              aspectRatio: 1.5,
              child: RadarChart(
                data,
                swapAnimationDuration: const Duration(milliseconds: 400),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<RadarGraphicModel>> getCompanyRadar(String code) {
    CompanyService cs = new CompanyService();
    return cs.getCompanyRadar(code);
  }
}

import 'package:flutter/material.dart';
import 'package:fraymobile/widgets/carpanlar.dart';
import 'package:fraymobile/widgets/company_details.dart';
import 'package:fraymobile/widgets/h_finansman_geliri_oncesi_faaliyet_kari_zarari.dart';
import 'package:fraymobile/widgets/radar_chart.dart';
import 'package:fraymobile/widgets/ratios%20copy.dart';
import 'package:fraymobile/widgets/ratios.dart';

class CompanyPage extends StatefulWidget {
  final String code;
  const CompanyPage(this.code, {Key? key}) : super(key: key);

  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  List<bool> isExpanded = [true, true, true, true, true];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Özet Rapor"),
        ),
        body: SingleChildScrollView(
          child: ExpansionPanelList(
            expansionCallback: (panelIndex, isExpand) {
              setState(() {
                isExpanded[panelIndex] = !isExpanded[panelIndex];
              });
            },
            animationDuration: Duration(milliseconds: 500),
            children: [
              ExpansionPanel(
                canTapOnHeader: true,
                isExpanded: isExpanded[0],
                headerBuilder: (context, isExpanded) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Firma Bilgileri",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  );
                },
                body: CompanyDetailsWidget(widget.code),
              ),
              ExpansionPanel(
                canTapOnHeader: true,
                isExpanded: isExpanded[1],
                headerBuilder: (context, isExpanded) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Çarpanlar",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  );
                },
                body: CarpanlarWidget(widget.code),
              ),
              ExpansionPanel(
                canTapOnHeader: true,
                isExpanded: isExpanded[2],
                headerBuilder: (context, isExpanded) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Şirket Detayları",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  );
                },
                body:
                    HFinansmanGeliriOncesiFaaliyetKarZarariWidget(widget.code),
              ),
              ExpansionPanel(
                canTapOnHeader: true,
                isExpanded: isExpanded[3],
                headerBuilder: (context, isExpanded) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Finansal Oranlar",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  );
                },
                body: RatiosWidget(widget.code),
              ),
              ExpansionPanel(
                canTapOnHeader: true,
                isExpanded: isExpanded[3],
                headerBuilder: (context, isExpanded) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Finansal Oranlar",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  );
                },
                body: Ratios2Widget(widget.code),
              ),
              ExpansionPanel(
                canTapOnHeader: true,
                isExpanded: isExpanded[4],
                headerBuilder: (context, isExpanded) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Radar Grafiği",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  );
                },
                body: RadarChartWidget(widget.code),
              ),
            ],
          ),
        ));
  }
}

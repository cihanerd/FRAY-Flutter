import 'package:flutter/material.dart';
import 'package:fraymobile/models/brief_report/company-details.dart';
import 'package:fraymobile/provider/companyService.dart';

class CompanyDetailsWidget extends StatefulWidget {
  final String code;
  const CompanyDetailsWidget(this.code, {Key? key}) : super(key: key);

  @override
  _CompanyDetailsWidgetState createState() => _CompanyDetailsWidgetState();
}

class _CompanyDetailsWidgetState extends State<CompanyDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: FutureBuilder(
        future: getCompanyDetails(),
        builder: (context, AsyncSnapshot<CompanyDetails> snapshot) {
          if (snapshot.hasData) {
            final comp = snapshot.data!;
            return Container(
              width: size.width * 0.95,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.3,
                        child: Text("Adres"),
                      ),
                      Container(
                        width: size.width * 0.65,
                        child: Text(comp.adres!),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 8)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.3,
                        child: Text("Telefon"),
                      ),
                      Container(
                        width: size.width * 0.65,
                        child: Text(comp.telefon!),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 8)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.3,
                        child: Text("Web Sitesi"),
                      ),
                      Container(
                        width: size.width * 0.65,
                        child: Text(comp.internet!),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 8)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.3,
                        child: Text("Mail"),
                      ),
                      Container(
                        width: size.width * 0.65,
                        child: Text(comp.email!),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 8)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.3,
                        child: Text("Sektör"),
                      ),
                      Container(
                        width: size.width * 0.65,
                        child: Text(comp.sektor!),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 8)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.3,
                        child: Text("Pazar"),
                      ),
                      Container(
                        width: size.width * 0.65,
                        child: Text(comp.pazar!),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 8)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.3,
                        child: Text("Endeksler"),
                      ),
                      Container(
                        width: size.width * 0.65,
                        child: Text(comp.endeksler!),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 8)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.3,
                        child: Text("Halka Açıklık Oranı"),
                      ),
                      Container(
                        width: size.width * 0.65,
                        child: Text(comp.aciklik!.substring(2, 4) + "%"),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10))
                ],
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

  Future<CompanyDetails> getCompanyDetails() {
    CompanyService cs = new CompanyService();
    return cs.getCompanyDetails(widget.code);
  }
}

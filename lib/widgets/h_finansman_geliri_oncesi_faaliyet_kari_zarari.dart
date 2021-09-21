import 'package:flutter/material.dart';
import 'package:fraymobile/models/brief_report/sub/h_finansman_geliri_gideri_oncesi_faaliyet_kar_zarari.dart';
import 'package:fraymobile/provider/companyService.dart';

class HFinansmanGeliriOncesiFaaliyetKarZarariWidget extends StatefulWidget {
  final String code;
  const HFinansmanGeliriOncesiFaaliyetKarZarariWidget(this.code, {Key? key})
      : super(key: key);

  @override
  _HFinansmanGeliriOncesiFaaliyetKarZarariWidgetState createState() =>
      _HFinansmanGeliriOncesiFaaliyetKarZarariWidgetState();
}

class _HFinansmanGeliriOncesiFaaliyetKarZarariWidgetState
    extends State<HFinansmanGeliriOncesiFaaliyetKarZarariWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(widget.code),
      builder: (context,
          AsyncSnapshot<HFinansmanGeliriGideriOncesiFaaliyetKarZarari>
              snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          return Container();
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<HFinansmanGeliriGideriOncesiFaaliyetKarZarari> getData(String code) {
    CompanyService cs = new CompanyService();
    return cs.getHFinansmanGeliriOncesiFaaliyetKariZarari(code);
  }
}

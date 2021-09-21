import 'package:flutter/material.dart';
import 'package:fraymobile/models/company/company.dart';
import 'package:fraymobile/provider/companyService.dart';
import 'package:fraymobile/screens/companyPage.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Company> liste = [];
  List<Company> filtreliListe = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Arama"),
      ),
      body: FutureBuilder(
        future: getAllCompanies(),
        builder: (context, AsyncSnapshot<List<Company>> snapshot) {
          if (snapshot.hasData) {
            liste = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: 'Ara...'),
                    onChanged: (value) {
                      if (value.trim().isEmpty) {
                        filtreliListe = [];
                        setState(() {});
                        return;
                      }
                      filtreliListe = liste.where((element) {
                        return element.name!
                            .toLowerCase()
                            .contains(value.toLowerCase());
                      }).toList();
                      setState(() {});
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Toplam Sonuç: " + filtreliListe.length.toString())
                    ],
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTapDown: (details) {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      child: ListView.builder(
                        itemCount: filtreliListe.length,
                        itemBuilder: (context, index) {
                          final company = filtreliListe[index];
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CompanyPage(company.code!),
                                  ));
                            },
                            leading: Icon(Icons.list_alt_outlined),
                            title: Text(company.name!),
                            subtitle: Text(company.adres ?? ""),
                          );
                        },
                      ),
                    ),
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
      ),
    );
  }

  Future<List<Company>> getAllCompanies() {
    CompanyService cs = new CompanyService();

    return cs.getAllCompanies();
  }
}

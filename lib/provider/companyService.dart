import 'package:fraymobile/models/brief_report/company-details.dart';
import 'package:fraymobile/models/brief_report/radar_graphic_model.dart';
import 'package:fraymobile/models/brief_report/ratios.dart';
import 'package:fraymobile/models/brief_report/sub/h_finansman_geliri_gideri_oncesi_faaliyet_kar_zarari.dart';
import 'package:fraymobile/models/company/company.dart';
import 'package:fraymobile/provider/servicebase.dart';

class CompanyService extends ServiceBase {
  Future<List<Company>> getAllCompanies() async {
    List<Company> companies = [];
    try {
      var response = await dio.get('company');
      for (var item in response.data) {
        companies.add(Company.fromJson(item));
      }
    } catch (e) {
      print(e);
    }

    return companies;
  }

  Future<CompanyDetails> getCompanyDetails(String code) async {
    CompanyDetails details = CompanyDetails();
    try {
      var response = await dio.get('company/$code');
      details = CompanyDetails.fromJson(response.data);
    } catch (e) {
      print(e);
    }
    return details;
  }

  Future<List<RadarGraphicModel>> getCompanyRadar(String code) async {
    List<RadarGraphicModel> radarData = [];
    try {
      var response = await dio.get('company/$code/radar');
      for (var item in response.data) {
        radarData.add(RadarGraphicModel.fromJson(item));
      }
    } catch (e) {
      print(e);
    }

    return radarData;
  }

  Future<HFinansmanGeliriGideriOncesiFaaliyetKarZarari>
      getHFinansmanGeliriOncesiFaaliyetKariZarari(String code) async {
    HFinansmanGeliriGideriOncesiFaaliyetKarZarari data =
        HFinansmanGeliriGideriOncesiFaaliyetKarZarari();
    try {
      var response = await dio.get(
          '/company/$code/sub/H%20Finansman%20Geliri%20(Gideri)%20%C3%96ncesi%20Faaliyet%20Kar%C4%B1%20(Zarar%C4%B1)');
      data =
          HFinansmanGeliriGideriOncesiFaaliyetKarZarari.fromJson(response.data);
    } catch (e) {
      print(e);
    }
    return data;
  }

  Future<List<Ratios>> getRatios(String code) async {
    List<Ratios> ratios = [];
    try {
      var response = await dio.get('company/$code/ratios');
      for (var item in response.data) {
        ratios.add(Ratios.fromJson(item));
      }
    } catch (e) {
      print(e);
    }

    return ratios;
  }
}

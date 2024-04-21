import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/components/constants.dart';
import 'package:newsapp/models/berita_models.dart';

class NetworkService {
  static Future<List<BeritaModels>?> fetchURLTerkini() async {
    try {
      var response = await http
          .get(Uri.parse(ApiConstant.baseURL + ApiConstant.endpointTerkini));
      final body = response.body;
      final result = jsonDecode(body);
      List<BeritaModels> beritamodels = List<BeritaModels>.from(
        result['data'].map(
          (beritamodels) => BeritaModels.fromJson(beritamodels),
        ),
      );
      return beritamodels;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<List<BeritaModels>?> fetchURLPolitik() async {
    try {
      var responsePolitik = await http
          .get(Uri.parse(ApiConstant.baseURL + ApiConstant.endpointPolitik));
      final bodyPolitik = responsePolitik.body;
      final resultPolitik = jsonDecode(bodyPolitik);
      List<BeritaModels> beritamodelsPolitik = List<BeritaModels>.from(
        resultPolitik['data'].map(
          (beritamodels) => BeritaModels.fromJson(beritamodels),
        ),
      );
      return beritamodelsPolitik;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<List<BeritaModels>?> fetchURLHukum() async {
    try {
      var responseHukum = await http
          .get(Uri.parse(ApiConstant.baseURL + ApiConstant.endpointHukum));
      final bodyHukum = responseHukum.body;
      final resultHukum = jsonDecode(bodyHukum);
      List<BeritaModels> beritamodelsHukum = List<BeritaModels>.from(
        resultHukum['data'].map(
          (beritamodels) => BeritaModels.fromJson(beritamodels),
        ),
      );
      return beritamodelsHukum;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<List<BeritaModels>?> fetchEkonomi() async {
    try {
      var responseEkonomi = await http
          .get(Uri.parse(ApiConstant.baseURL + ApiConstant.endpointEkonomi));
      final bodyEkonomi = responseEkonomi.body;
      final resultEkonomi = jsonDecode(bodyEkonomi);
      List<BeritaModels> beritamodelsHukum = List<BeritaModels>.from(
        resultEkonomi['data'].map(
          (beritamodels) => BeritaModels.fromJson(beritamodels),
        ),
      );
      return beritamodelsHukum;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<List<BeritaModels>?> fetchMetro() async {
    try {
      var responseMetro = await http
          .get(Uri.parse(ApiConstant.baseURL + ApiConstant.endpointMetro));
      final bodyMetro = responseMetro.body;
      final resultMetro = jsonDecode(bodyMetro);
      List<BeritaModels> beritamodelsMetro = List<BeritaModels>.from(
        resultMetro['data'].map(
          (beritamodelsMetro) => BeritaModels.fromJson(beritamodelsMetro),
        ),
      );
      return beritamodelsMetro;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<List<BeritaModels>?> fetchSepakBola() async {
    try {
      var responseSepakBola = await http
          .get(Uri.parse(ApiConstant.baseURL + ApiConstant.endpointSepakBola));
      final bodySepakBola = responseSepakBola.body;
      final resultSepakBola = jsonDecode(bodySepakBola);
      List<BeritaModels> beritamodelsSepakBola = List<BeritaModels>.from(
        resultSepakBola['data'].map(
          (beritamodelsSepakBola) =>
              BeritaModels.fromJson(beritamodelsSepakBola),
        ),
      );
      return beritamodelsSepakBola;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<List<BeritaModels>?> fetchOlahraga() async {
    var responseOlahraga = await http
        .get(Uri.parse(ApiConstant.baseURL + ApiConstant.endpointOlahraga));
    final bodyOlahraga = responseOlahraga.body;
    final resultOlahraga = jsonDecode(bodyOlahraga);
    List<BeritaModels> beritamodelOlahraga = List<BeritaModels>.from(
      resultOlahraga['data'].map(
        (beritamodelsOlahraga) => BeritaModels.fromJson(beritamodelsOlahraga),
      ),
    );
    return beritamodelOlahraga;
  }

  static Future<List<BeritaModels>?> fetchHumaniora() async {
    var responseHumaniora = await http
        .get(Uri.parse(ApiConstant.baseURL + ApiConstant.endpointHumaniora));
    final bodyHumaniora = responseHumaniora.body;
    final resultHumaniora = jsonDecode(bodyHumaniora);
    List<BeritaModels> beritamodelHumaniora = List<BeritaModels>.from(
      resultHumaniora['data'].map(
        (beritamodelsOlahraga) => BeritaModels.fromJson(beritamodelsOlahraga),
      ),
    );
    return beritamodelHumaniora;
  }

  static Future<List<BeritaModels>?> fetchLifestyle() async {
    var responseLifestyle = await http
        .get(Uri.parse(ApiConstant.baseURL + ApiConstant.endpointLifestyle));
    final bodyLifestyle = responseLifestyle.body;
    final resultLifestyle = jsonDecode(bodyLifestyle);
    List<BeritaModels> beritamodelLifestyle = List<BeritaModels>.from(
      resultLifestyle['data'].map(
        (beritamodelsLifestyle) => BeritaModels.fromJson(beritamodelsLifestyle),
      ),
    );
    return beritamodelLifestyle;
  }

  static Future<List<BeritaModels>?> fetchHiburan() async {
    var responseHiburan = await http
        .get(Uri.parse(ApiConstant.baseURL + ApiConstant.endpointHiburan));
    final bodyHiburan = responseHiburan.body;
    final resultHiburan = jsonDecode(bodyHiburan);
    List<BeritaModels> beritamodelHiburan = List<BeritaModels>.from(
      resultHiburan['data'].map(
        (beritamodelsHiburan) => BeritaModels.fromJson(beritamodelsHiburan),
      ),
    );
    return beritamodelHiburan;
  }

  static Future<List<BeritaModels>?> fetchDunia() async {
    var responseDunia = await http
        .get(Uri.parse(ApiConstant.baseURL + ApiConstant.endpointDunia));
    final bodyDunia = responseDunia.body;
    final resultDunia = jsonDecode(bodyDunia);
    List<BeritaModels> beritamodelDunia = List<BeritaModels>.from(
      resultDunia['data'].map(
        (beritamodelsDunia) => BeritaModels.fromJson(beritamodelsDunia),
      ),
    );
    return beritamodelDunia;
  }

  static Future<List<BeritaModels>?> fetchTekno() async {
    var responseTekno = await http
        .get(Uri.parse(ApiConstant.baseURL + ApiConstant.endpointTekno));
    final bodyTekno = responseTekno.body;
    final resultTekno = jsonDecode(bodyTekno);
    List<BeritaModels> beritamodelTekno = List<BeritaModels>.from(
      resultTekno['data'].map(
        (beritamodelsTekno) => BeritaModels.fromJson(beritamodelsTekno),
      ),
    );
    return beritamodelTekno;
  }

  static Future<List<BeritaModels>?> fetchOtomotif() async {
    var responseOtomotif = await http
        .get(Uri.parse(ApiConstant.baseURL + ApiConstant.endpointOtomotif));
    final bodyOtomotif = responseOtomotif.body;
    final resultOtomotif = jsonDecode(bodyOtomotif);
    List<BeritaModels> beritamodelOtomotif = List<BeritaModels>.from(
      resultOtomotif['data'].map(
        (beritamodelsOtomotif) => BeritaModels.fromJson(beritamodelsOtomotif),
      ),
    );
    return beritamodelOtomotif;
  }

  static Future<List<BeritaModels>?> fetchWartaBumi() async {
    var responseWartaBumi = await http
        .get(Uri.parse(ApiConstant.baseURL + ApiConstant.endpointWartaBumi));
    final bodyWartaBumi = responseWartaBumi.body;
    final resultWartaBumi = jsonDecode(bodyWartaBumi);
    List<BeritaModels> beritamodelWartaBumi = List<BeritaModels>.from(
      resultWartaBumi['data'].map(
        (beritamodelsWartaBumi) => BeritaModels.fromJson(beritamodelsWartaBumi),
      ),
    );
    return beritamodelWartaBumi;
  }

  static Future<List<BeritaModels>?> fetchRilisPers() async {
    var responseRilisPers = await http
        .get(Uri.parse(ApiConstant.baseURL + ApiConstant.endpointRilispers));
    final bodyRilisPers = responseRilisPers.body;
    final resultRilisPers = jsonDecode(bodyRilisPers);
    List<BeritaModels> beritamodelRilisPers = List<BeritaModels>.from(
      resultRilisPers['data'].map(
        (beritamodelsRilisPers) => BeritaModels.fromJson(beritamodelsRilisPers),
      ),
    );
    return beritamodelRilisPers;
  }
  
  static Future<List<BeritaModels>?> fetchTerpopuler() async {
    var responseTerpopuler = await http
        .get(Uri.parse(ApiConstant.baseURL + ApiConstant.endpointTerpopuler));
    final bodyTerpopuler = responseTerpopuler.body;
    final resultTerpopuler = jsonDecode(bodyTerpopuler);
    List<BeritaModels> beritamodelTerpopuler = List<BeritaModels>.from(
      resultTerpopuler['data'].map(
        (beritamodelsTerpopuler) => BeritaModels.fromJson(beritamodelsTerpopuler),
      ),
    );
    return beritamodelTerpopuler;
  }
}

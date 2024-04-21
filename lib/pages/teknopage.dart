import 'package:flutter/material.dart';
import 'package:newsapp/models/berita_models.dart';
import 'package:newsapp/services/network_service.dart';
import 'package:url_launcher/url_launcher.dart';

class TeknoPage extends StatefulWidget {
  const TeknoPage({super.key});

  @override
  State<TeknoPage> createState() => _TeknoPageState();
}

class _TeknoPageState extends State<TeknoPage> {
  bool isLoading = true;
  List<BeritaModels>? beritamodelsTeknoPage = [];

  Future<void> _fetchTeno() async {
    isLoading = true;
    final resultTeknoPage = await NetworkService.fetchTekno();
    beritamodelsTeknoPage = resultTeknoPage;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    _fetchTeno();
  }

  Future<void> refreshTeknoPage() async {
    await _fetchTeno();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Kepo",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refreshTeknoPage,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: beritamodelsTeknoPage!.length,
                itemBuilder: (BuildContext context, int index) {
                  final urlTekno = beritamodelsTeknoPage![index];
                  return Card(
                    child: ListTile(
                      leading: Image(
                        image: NetworkImage(urlTekno.image),
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        urlTekno.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Text(
                        '${urlTekno.description} ...',
                        style: const TextStyle(fontSize: 13),
                      ),
                      onTap: () {
                        launchUrl(Uri.parse(urlTekno.link));
                      },
                    ),
                  );
                }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:newsapp/models/berita_models.dart';
import 'package:newsapp/services/network_service.dart';
import 'package:url_launcher/url_launcher.dart';

class DuniaPage extends StatefulWidget {
  const DuniaPage({super.key});

  @override
  State<DuniaPage> createState() => _DuniaPageState();
}

class _DuniaPageState extends State<DuniaPage> {
  bool isLoading = true;
  List<BeritaModels>? beritamodelsDuniaPage = [];

  Future<void> _fetchDunia() async {
    isLoading = true;
    final resultDuniaPage = await NetworkService.fetchDunia();
    beritamodelsDuniaPage = resultDuniaPage;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    _fetchDunia();
  }

  Future<void> refreshDuniaPage() async {
    await _fetchDunia();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Kepo", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refreshDuniaPage,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: beritamodelsDuniaPage!.length,
                itemBuilder: (BuildContext context, int index) {
                  final urlDunia = beritamodelsDuniaPage![index];
                  return Card(
                    child: ListTile(
                      leading: Image(
                        image: NetworkImage(urlDunia.image),
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        urlDunia.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Text(
                        '${urlDunia.description} ...',
                        style: const TextStyle(fontSize: 13),
                      ),
                      onTap: () {
                        launchUrl(Uri.parse(urlDunia.link));
                      },
                    ),
                  );
                }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:newsapp/models/berita_models.dart';
import 'package:newsapp/services/network_service.dart';
import 'package:url_launcher/url_launcher.dart';

class SepakBolaPage extends StatefulWidget {
  const SepakBolaPage({super.key});

  @override
  State<SepakBolaPage> createState() => _SepakBolaPageState();
}

class _SepakBolaPageState extends State<SepakBolaPage> {
  bool isLoading = true;
  List<BeritaModels>? modelsSepakBola = [];

  Future<void> _fetchSepakBola() async {
    isLoading = true;
    final resultSepakBola = await NetworkService.fetchSepakBola();
    modelsSepakBola = resultSepakBola;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    _fetchSepakBola();
  }

  Future<void> _refreshSepakBola() async{
    await _fetchSepakBola();
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
        onRefresh: _refreshSepakBola,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: modelsSepakBola!.length,
                itemBuilder: (BuildContext context, int index) {
                  final urlSepakBola = modelsSepakBola![index];
                  return Card(
                    child: ListTile(
                      leading: Image(image: NetworkImage(urlSepakBola.image)),
                      title: Text(
                        urlSepakBola.title,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${urlSepakBola.description} ...',
                        style: const TextStyle(fontSize: 13),
                      ),
                      onTap: () {
                        launchUrl(Uri.parse(urlSepakBola.link));
                      },
                    ),
                  );
                }),
      ),
    );
  }
}

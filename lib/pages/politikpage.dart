import 'package:flutter/material.dart';
import 'package:newsapp/models/berita_models.dart';
import 'package:newsapp/services/network_service.dart';
import 'package:url_launcher/url_launcher.dart';

class PolitikPage extends StatefulWidget {
  const PolitikPage({super.key});

  @override
  State<PolitikPage> createState() => _PolitikPageState();
}

class _PolitikPageState extends State<PolitikPage> {
  List<BeritaModels>? beritaModelsPolitik = [];
  bool isLoading = true;

  Future<void> _fetchPolitik() async {
    isLoading = true;
    final resultPolitik = await NetworkService.fetchURLPolitik();
    beritaModelsPolitik = resultPolitik;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    _fetchPolitik();
  }

  Future<void> _refreshPolitik() async {
    await _fetchPolitik();
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
        onRefresh: _refreshPolitik,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (BuildContext context, int index) {
                  final urlPolitik = beritaModelsPolitik![index];
                  return Card(
                    child: ListTile(
                      leading: Image(
                        image: NetworkImage(urlPolitik.image),
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        urlPolitik.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle: Text(
                        '${urlPolitik.description} ...',
                        style: const TextStyle(fontSize: 13),
                      ),
                      onTap: () {
                        launchUrl(Uri.parse(urlPolitik.link));
                      },
                    ),
                  );
                },
                itemCount: beritaModelsPolitik!.length,
              ),
      ),
    );
  }
}

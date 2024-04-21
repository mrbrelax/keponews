import 'package:flutter/material.dart';
import 'package:newsapp/models/berita_models.dart';
import 'package:newsapp/services/network_service.dart';
import 'package:url_launcher/url_launcher.dart';

class EkonomiPage extends StatefulWidget {
  const EkonomiPage({super.key});

  @override
  State<EkonomiPage> createState() => _EkonomiPageState();
}

class _EkonomiPageState extends State<EkonomiPage> {
  List<BeritaModels>? beritamodelsEkonomi = [];
  bool isLoading = true;

  Future<void> _fetchEkonomi() async {
    isLoading = true;
    final resultEkonomi = await NetworkService.fetchEkonomi();
    beritamodelsEkonomi = resultEkonomi;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    _fetchEkonomi();
  }

  Future<void> _refreshEkonomi() async {
    await _fetchEkonomi();
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
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshEkonomi,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: beritamodelsEkonomi!.length,
                itemBuilder: (BuildContext context, int index) {
                  final urlEkonomi = beritamodelsEkonomi![index];
                  return Card(
                    child: ListTile(
                      leading: Image(
                        image: NetworkImage(urlEkonomi.image),
                      ),
                      title: Text(
                        urlEkonomi.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle: Text(
                        '${urlEkonomi.description} ...',
                        style: const TextStyle(fontSize: 13),
                      ),
                      onTap: () {
                        launchUrl(Uri.parse(urlEkonomi.link));
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}

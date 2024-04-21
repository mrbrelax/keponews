import 'package:flutter/material.dart';
import 'package:newsapp/models/berita_models.dart';
import 'package:newsapp/services/network_service.dart';
import 'package:url_launcher/url_launcher.dart';

class OlahragaPage extends StatefulWidget {
  const OlahragaPage({super.key});

  @override
  State<OlahragaPage> createState() => _OlahragaPageState();
}

class _OlahragaPageState extends State<OlahragaPage> {
  bool isLoading = true;
  List<BeritaModels>? beritamodelsOlahraga = [];

  Future<void> _fetchOlahraga() async {
    isLoading = true;
    final resultOlahraga = await NetworkService.fetchOlahraga();
    beritamodelsOlahraga = resultOlahraga;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    _fetchOlahraga();
  }

  Future<void> _refreshOlahraga() async {
    await _fetchOlahraga();
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
        onRefresh: _refreshOlahraga,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: beritamodelsOlahraga!.length,
                itemBuilder: (BuildContext context, int index) {
                  final urlOlahraga = beritamodelsOlahraga![index];
                  return Card(
                    child: ListTile(
                      leading: Image(image: NetworkImage(urlOlahraga.image)),
                      title: Text(
                        urlOlahraga.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle: Text(
                        '${urlOlahraga.description} ...',
                        style: const TextStyle(fontSize: 13),
                      ),
                      onTap: () {
                        launchUrl(Uri.parse(urlOlahraga.link));
                      },
                    ),
                  );
                }),
      ),
    );
  }
}

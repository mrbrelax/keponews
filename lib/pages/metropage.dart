import 'package:flutter/material.dart';
import 'package:newsapp/models/berita_models.dart';
import 'package:newsapp/services/network_service.dart';
import 'package:url_launcher/url_launcher.dart';

class MetroPage extends StatefulWidget {
  const MetroPage({super.key});

  @override
  State<MetroPage> createState() => _MetroPageState();
}

class _MetroPageState extends State<MetroPage> {
  bool isLoading = true;
  List<BeritaModels>? modelsMetro = [];

  Future<void> _fetchMetro() async {
    isLoading = true;
    final resultMetro = await NetworkService.fetchMetro();
    modelsMetro = resultMetro;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    _fetchMetro();
  }

  Future<void> _refreshMetro() async {
    await _fetchMetro();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
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
        onRefresh: _refreshMetro,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: modelsMetro!.length,
                itemBuilder: (BuildContext context, int index) {
                  final urlMetro = modelsMetro![index];
                  return Card(
                    child: ListTile(
                      leading: Image(image: NetworkImage(urlMetro.image)),
                      title: Text(
                        urlMetro.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle: Text(
                        '${urlMetro.description} ...',
                        style: const TextStyle(fontSize: 13),
                      ),
                      onTap: () {
                        launchUrl(Uri.parse(urlMetro.link));
                      },
                    ),
                  );
                }),
      ),
    );
  }
}

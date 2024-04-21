import 'package:flutter/material.dart';
import 'package:newsapp/models/berita_models.dart';
import 'package:newsapp/services/network_service.dart';
import 'package:url_launcher/url_launcher.dart';

class HukumPage extends StatefulWidget {
  const HukumPage({super.key});

  @override
  State<HukumPage> createState() => _HukumPageState();
}

class _HukumPageState extends State<HukumPage> {
  List<BeritaModels>? beritaHukum = [];
  bool isLoading = true;

  Future<void> _fetchURLHukum() async {
    isLoading = true;

    final resultHukum = await NetworkService.fetchURLHukum();
    beritaHukum = resultHukum;
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _fetchURLHukum();
  }

  Future<void> _refreshHukum() async {
    await _fetchURLHukum();
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
        onRefresh: _refreshHukum,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: beritaHukum!.length,
                itemBuilder: (BuildContext context, int index) {
                  final urlHukum = beritaHukum![index];
                  return Card(
                    child: ListTile(
                      leading: Image(image: NetworkImage(urlHukum.image)),
                      title: Text(
                        urlHukum.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle: Text(
                        urlHukum.description,
                        style: const TextStyle(fontSize: 13),
                      ),
                      onTap: () {
                        launchUrl(Uri.parse(urlHukum.link));
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}

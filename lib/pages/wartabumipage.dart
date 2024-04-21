import 'package:flutter/material.dart';
import 'package:newsapp/models/berita_models.dart';
import 'package:newsapp/services/network_service.dart';
import 'package:url_launcher/url_launcher.dart';

class WartaBumiPage extends StatefulWidget {
  const WartaBumiPage({super.key});

  @override
  State<WartaBumiPage> createState() => _WartaBumiPageState();
}

class _WartaBumiPageState extends State<WartaBumiPage> {
  bool isLoading = true;
  List<BeritaModels>? beritaWartaBumi = [];

  Future<void> _fetchWartaBumi() async {
    isLoading = true;
    final resultWartaBumiPage = await NetworkService.fetchWartaBumi();
    beritaWartaBumi = resultWartaBumiPage;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    _fetchWartaBumi();
  }

  Future<void> refreshWartaBumi() async {
    await _fetchWartaBumi();
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
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refreshWartaBumi,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: beritaWartaBumi!.length,
                itemBuilder: (BuildContext context, int index) {
                  final urlWartaBumi = beritaWartaBumi![index];
                  return Card(
                    child: ListTile(
                      leading: Image(
                        image: NetworkImage(urlWartaBumi.image),
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        urlWartaBumi.title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${urlWartaBumi.description} ...',
                        style: const TextStyle(fontSize: 13),
                      ),
                      onTap: () {
                        launchUrl(Uri.parse(urlWartaBumi.link));
                      },
                    ),
                  );
                }),
      ),
    );
  }
}

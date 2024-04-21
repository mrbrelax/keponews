import 'package:flutter/material.dart';
import 'package:newsapp/models/berita_models.dart';
import 'package:newsapp/services/network_service.dart';
import 'package:url_launcher/url_launcher.dart';

class TerpopulerPage extends StatefulWidget {
  const TerpopulerPage({super.key});

  @override
  State<TerpopulerPage> createState() => _TerpopulerPageState();
}

class _TerpopulerPageState extends State<TerpopulerPage> {
  bool isLoading = true;
  List<BeritaModels>? beritamodelsTopNews = [];

  Future<void> _fetchTerpopulerNews() async {
    isLoading = true;
    final resultTopNews = await NetworkService.fetchTerpopuler();
    beritamodelsTopNews = resultTopNews;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    _fetchTerpopulerNews();
  }

  Future<void> refreshTopNews() async {
    await _fetchTerpopulerNews();
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
        onRefresh: refreshTopNews,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: beritamodelsTopNews!.length,
                itemBuilder: (BuildContext context, int index) {
                  final urlTerpopuler = beritamodelsTopNews![index];
                  return Card(
                    child: ListTile(
                      leading: Image(
                        image: NetworkImage(urlTerpopuler.image),
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        urlTerpopuler.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle: Text(
                        '${urlTerpopuler.description} ...',
                        style: const TextStyle(fontSize: 13),
                      ),
                      onTap: () {
                        launchUrl(Uri.parse(urlTerpopuler.link));
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}

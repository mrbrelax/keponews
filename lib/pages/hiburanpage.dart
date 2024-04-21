import 'package:flutter/material.dart';
import 'package:newsapp/models/berita_models.dart';
import 'package:newsapp/services/network_service.dart';
import 'package:url_launcher/url_launcher.dart';

class HiburanPage extends StatefulWidget {
  const HiburanPage({super.key});

  @override
  State<HiburanPage> createState() => _HiburanPageState();
}

class _HiburanPageState extends State<HiburanPage> {
  bool isLoading = true;
  List<BeritaModels>? beritamodelsHiburanPage = [];

  Future<void> _fetchHiburanPage() async {
    isLoading = true;
    final resultHiburanPage = await NetworkService.fetchHiburan();
    beritamodelsHiburanPage = resultHiburanPage;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    _fetchHiburanPage();
  }

  Future<void> refreshHiburanPage() async {
    await _fetchHiburanPage();
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
        onRefresh: refreshHiburanPage,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: beritamodelsHiburanPage!.length,
                itemBuilder: (BuildContext context, int index) {
                  final urlHiburanPage = beritamodelsHiburanPage![index];
                  return Card(
                    child: ListTile(
                      leading: Image(
                        image: NetworkImage(urlHiburanPage.image),
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        urlHiburanPage.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle: Text(
                        '${urlHiburanPage.description} ...',
                        style: const TextStyle(fontSize: 13),
                      ),
                      onTap: () {
                        launchUrl(Uri.parse(urlHiburanPage.link));
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}

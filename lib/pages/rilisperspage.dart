import 'package:flutter/material.dart';
import 'package:newsapp/models/berita_models.dart';
import 'package:newsapp/services/network_service.dart';
import 'package:url_launcher/url_launcher.dart';

class RilisPersPage extends StatefulWidget {
  const RilisPersPage({super.key});

  @override
  State<RilisPersPage> createState() => _RilisPersPageState();
}

class _RilisPersPageState extends State<RilisPersPage> {
  bool isLoading = true;
  List<BeritaModels>? beritaRilisPers = [];

  Future<void> _fetchRilisPers() async {
    isLoading = true;
    final resultRilisPersPage = await NetworkService.fetchRilisPers();
    beritaRilisPers = resultRilisPersPage;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    _fetchRilisPers();
  }

  Future<void> refreshRilisPersPage() async {
    await _fetchRilisPers();
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
        onRefresh: refreshRilisPersPage,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: beritaRilisPers!.length,
                itemBuilder: (BuildContext context, int index) {
                  final urlRilisPers = beritaRilisPers![index];
                  return Card(
                    child: ListTile(
                      leading: Image(
                        image: NetworkImage(urlRilisPers.image),
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        urlRilisPers.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Text(
                        '${urlRilisPers.description} ...',
                        style: const TextStyle(fontSize: 13),
                      ),
                      onTap: () {
                        launchUrl(Uri.parse(urlRilisPers.link));
                      },
                    ),
                  );
                }),
      ),
    );
  }
}

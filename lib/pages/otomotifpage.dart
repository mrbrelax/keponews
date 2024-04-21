import 'package:flutter/material.dart';
import 'package:newsapp/models/berita_models.dart';
import 'package:newsapp/services/network_service.dart';
import 'package:url_launcher/url_launcher.dart';

class OtomotifPage extends StatefulWidget {
  const OtomotifPage({super.key});

  @override
  State<OtomotifPage> createState() => _OtomotifPageState();
}

class _OtomotifPageState extends State<OtomotifPage> {
  bool isLoading = true;
  List<BeritaModels>? beritamodelsOtomotifPage = [];

  Future<void> _fetchOtomotifPage() async {
    isLoading = true;
    final resultOtomotif = await NetworkService.fetchOtomotif();
    beritamodelsOtomotifPage = resultOtomotif;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    _fetchOtomotifPage();
  }

  Future<void> refreshOtomotif() async {
    await _fetchOtomotifPage();
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
            )
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refreshOtomotif,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: beritamodelsOtomotifPage!.length,
                itemBuilder: (BuildContext context, int index) {
                  final urlOtomotif = beritamodelsOtomotifPage![index];
                  return Card(
                    child: ListTile(
                      leading: Image(
                        image: NetworkImage(urlOtomotif.image),
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        urlOtomotif.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Text(
                        '${urlOtomotif.description} ...',
                        style: const TextStyle(fontSize: 13),
                      ),
                      onTap: () {
                        launchUrl(Uri.parse(urlOtomotif.link));
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}

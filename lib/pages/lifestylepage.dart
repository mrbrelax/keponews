import 'package:flutter/material.dart';
import 'package:newsapp/models/berita_models.dart';
import 'package:newsapp/services/network_service.dart';
import 'package:url_launcher/url_launcher.dart';

class LifeStylePage extends StatefulWidget {
  const LifeStylePage({super.key});

  @override
  State<LifeStylePage> createState() => _LifeStylePageState();
}

class _LifeStylePageState extends State<LifeStylePage> {
  bool isLoading = true;
  List<BeritaModels>? beritamodelLifestylePage = [];

  Future<void> _fetchLifeStyle() async {
    isLoading = true;
    final resultLifeStylePage = await NetworkService.fetchLifestyle();
    beritamodelLifestylePage = resultLifeStylePage;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    _fetchLifeStyle();
  }

  Future<void> refershLifestylePage() async {
    await _fetchLifeStyle();
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
        onRefresh: refershLifestylePage,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: beritamodelLifestylePage!.length,
                itemBuilder: (BuildContext context, int index) {
                  final urlLifeStyle = beritamodelLifestylePage![index];
                  return Card(
                    child: ListTile(
                      leading: Image(
                        image: NetworkImage(urlLifeStyle.image),
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        urlLifeStyle.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle: Text(
                        '${urlLifeStyle.description} ...',
                        style: const TextStyle(fontSize: 13),
                      ),
                      onTap: () {
                        launchUrl(Uri.parse(urlLifeStyle.link));
                      },
                    ),
                  );
                }),
      ),
    );
  }
}

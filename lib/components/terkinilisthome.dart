import 'package:flutter/material.dart';
import 'package:newsapp/models/berita_models.dart';
import 'package:newsapp/services/network_service.dart';
import 'package:url_launcher/url_launcher.dart';

class TerkiniListHome extends StatefulWidget {
  const TerkiniListHome({super.key});

  @override
  State<TerkiniListHome> createState() => _TerkiniListHomeState();
}

class _TerkiniListHomeState extends State<TerkiniListHome> {
  List<BeritaModels>? beritaModelsTerkini = [];
  bool isLoading = true;

  Future<void> _fetchNews() async {
    isLoading = true;

    final resultTerkini = await NetworkService.fetchURLTerkini();
    beritaModelsTerkini = resultTerkini;
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _refreshListHome() async {
    await _fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshListHome,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  final urlModels = beritaModelsTerkini![index];
                  return Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Image(
                        image: NetworkImage(urlModels.image),
                        fit: BoxFit.fill,
                      ),
                      title: Text(
                        urlModels.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Text(
                        '${urlModels.description} ...',
                        style: const TextStyle(fontSize: 13),
                      ),
                      onTap: () {
                        launchUrl(Uri.parse(urlModels.link));
                      },
                    ),
                  );
                },
                itemCount: beritaModelsTerkini!.length > 3
                    ? 3
                    : beritaModelsTerkini!.length,
              ),
      ),
    );
  }
}

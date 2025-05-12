import 'package:Formulapp/home_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Formulapp/colors/themeProvider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          FloatingActionButton(
            onPressed: () {
              themeProvider.trocarTema();
            },
            child: Icon(themeProvider.themeData.brightness == Brightness.dark
                ? Icons.nights_stay
                : Icons.wb_sunny),
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/images/formula1_spl.png', width: 400),
                const SizedBox(height: 20),
                Image.asset('assets/images/logo_app.png', width: 200),
                const SizedBox(height: 30),
                const Text('SAIBA TUDO SOBRE O TOPO'),
                const Text('DO AUTOMOBILISMO MUNDIAL',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold)),
                const SizedBox(height: 290),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      child: const Text("IR PARA O APP")),
                ),
                const Divider(color: Colors.red, height: 20),
                const Text('NOSSAS REDES SOCIAIS',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                        onPressed: () async {
                          final Uri url = Uri.parse(
                              'https://github.com/EduardoAparecido18');

                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            throw 'NAO FOI POSSIVEL ABRI';
                          }
                        },
                        child: Image.asset('assets/images/github_logo.jpg')),
                    const SizedBox(width: 40),
                    FloatingActionButton(
                      onPressed: () async {
                        final Uri url = Uri.parse(
                            'https://www.linkedin.com/in/eduardo-aparecido-455a372ba/ ');

                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'NAO FOI POSSIVEL ABRI';
                        }
                      },
                      child: Image.asset('assets/images/instagram_logo.png'),
                    ),
                    const SizedBox(width: 40),
                    FloatingActionButton(
                      onPressed: () async {
                        final Uri url = Uri.parse(
                            'www.linkedin.com/in/eduardo-aparecido-455a372ba');

                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'NAO FOI POSSIVEL ABRI';
                        }
                      },
                      child: Image.asset('assets/images/linkedin.png'),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    SizedBox(width: 65),
                    Text('Github'),
                    SizedBox(width: 27),
                    Text('Instagram'),
                    SizedBox(width: 15),
                    Text('Linkedin'),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

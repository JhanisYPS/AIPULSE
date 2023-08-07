import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ECG App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String ecgSignal = "Sample ECG Signal";
  int bpm = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 100,
              color: Colors.grey,
            ),
            SizedBox(height: 20),
            Text('ECG Signal: $ecgSignal'),
            SizedBox(height: 20),
            Text('BPM: $bpm'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  ecgSignal = "Updated ECG Signal";
                  bpm = 80;
                });
              },
              child: Text('Aferir ECG'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HistoryPage()));
              },
              child: Text('Histórico'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool hasArrhythmia = true;
                if (hasArrhythmia) {
                  await _sendEmergencyNotification();
                }
              },
              child: Text('Verificar Arritmia'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendEmergencyNotification() async {
    print("Sending emergency notification to 192...");

    Location location = Location();
    LocationData? currentLocation; // Adição do operador de nulidade
    try {
      currentLocation = await location.getLocation();
    } on PlatformException catch (e) {
      print("Error obtaining location: ${e.message}");
    }

    if (currentLocation != null) {
      String locationText =
          "Latitude: ${currentLocation.latitude}, Longitude: ${currentLocation.longitude}";
      String diagnosis = "Sample Diagnosis";
      print(
          "Emergency notification sent: Location - $locationText, Diagnosis - $diagnosis");
    }
  }
}

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Histórico')),
      body: Center(
        child: Text('Histórico de Aferições'),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configurações')),
      body: Center(
        child: Text('Tela de Configurações'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ECG App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
            Text('ECG Signal: $ecgSignal'),
            SizedBox(height: 20),
            Text('BPM: $bpm'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simulate ECG signal and BPM update
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
                // Go to History Page
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HistoryPage()));
              },
              child: Text('Histórico'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Check for arrhythmia and notify emergency if needed
                bool hasArrhythmia =
                    true; // Replace with actual arrhythmia check
                if (hasArrhythmia) {
                  _sendEmergencyNotification();
                }
              },
              child: Text('Verificar Arritmia'),
            ),
          ],
        ),
      ),
    );
  }

  void _sendEmergencyNotification() {
    // Simulate sending emergency notification
    print("Sending emergency notification to 192...");
    String location = "Sample Location"; // Replace with actual location
    String diagnosis = "Sample Diagnosis"; // Replace with actual diagnosis
    print(
        "Emergency notification sent: Location - $location, Diagnosis - $diagnosis");
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

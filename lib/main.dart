import 'package:flutter/material.dart';

void main() {
  runApp(const BrizzyApp());
}

class BrizzyApp extends StatelessWidget {
  const BrizzyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brizzy Football',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF101820),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTab = 0;

  final List<String> tabs = [
    'General',
    'VIP',
    'FIFA Scores',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '⚽ BRIZZY FOOTBALL',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF16232D),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Football Prediction Centre',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Match statistics and analysis',
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 20),
          Row(
            children: List.generate(tabs.length, (index) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedTab == index
                          ? Colors.green
                          : Colors.blueGrey,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedTab = index;
                      });
                    },
                    child: Text(tabs[index]),
                  ),
                ),
              );
            }),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (selectedTab == 0) ...[
                  matchCard('General Predictions',
                      'A selection of match analysis'),
                  marketCard(),
                ],
                if (selectedTab == 1) ...[
                  matchCard('VIP Analysis',
                      'Detailed statistical analysis'),
                  marketCard(),
                ],
                if (selectedTab == 2) ...[
                  matchCard('FIFA Correct Scores',
                      'Virtual football section'),
                  const Text(
                    'FIFA match data will appear here.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
                const SizedBox(height: 20),
                const Text(
                  'Demo content only. Predictions are estimates, '
                  'not guaranteed results.',
                  style: TextStyle(color: Colors.orangeAccent),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget matchCard(String title, String subtitle) {
    return Card(
      color: const Color(0xFF1D303B),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 8),
            Text(subtitle),
            const SizedBox(height: 12),
            const Text('Upcoming match data will appear here.'),
          ],
        ),
      ),
    );
  }

  Widget marketCard() {
    const markets = [
      'Correct Score',
      '1X2 Result',
      'Both Teams to Score',
      'Over / Under 1.5',
      'Over / Under 2.5',
      'Over / Under 3.5',
      'Over / Under 4.5',
      'First-Half Result',
      'Second-Half Result',
      'Total Corners',
    ];

    return Card(
      color: const Color(0xFF1D303B),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Prediction Markets',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...markets.map(
              (market) => ListTile(
                leading: const Icon(
                  Icons.sports_soccer,
                  color: Colors.green,
                ),
                title: Text(market),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


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
      title: 'Brizzy Football Prediction',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087F5B),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF07130F),
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
          'BRIZZY FOOTBALL',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.sports_soccer, color: Colors.greenAccent),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF103D2C),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FOOTBALL INSIGHTS',
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Analyse matches. Explore predictions.',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Statistics-based estimates, not guaranteed results.',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: List.generate(tabs.length, (index) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: FilledButton(
                      onPressed: () {
                        setState(() => selectedTab = index);
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: selectedTab == index
                            ? Colors.green.shade700
                            : const Color(0xFF182720),
                      ),
                      child: Text(
                        tabs[index],
                        maxLines: 1,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  selectedTab == 0
                      ? 'GENERAL PREDICTIONS'
                      : selectedTab == 1
                          ? 'VIP ANALYSIS'
                          : 'FIFA / VIRTUAL SCORES',
                  style: const TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                if (selectedTab == 2)
                  const MatchCard(
                    home: 'FIFA Team A',
                    away: 'FIFA Team B',
                    score: 'Sample: 2 - 1',
                    market: 'Correct score',
                  )
                else ...[
                  const MatchCard(
                    home: 'Home Team',
                    away: 'Away Team',
                    score: 'Sample: 2 - 1',
                    market: 'Correct score estimate',
                  ),
                  const MatchCard(
                    home: 'Home Team',
                    away: 'Away Team',
                    score: 'Sample: 1 - 1',
                    market: '1X2 • Both teams to score',
                  ),
                  const MatchCard(
                    home: 'Home Team',
                    away: 'Away Team',
                    score: 'Sample: Over 2.5',
                    market: 'Goals market estimate',
                  ),
                ],
                const SizedBox(height: 12),
                const Text(
                  'Demo only: these are sample entries, not live fixtures '
                  'or verified predictions. Real match data and a tested '
                  'prediction model must be connected next.',
                  style: TextStyle(color: Colors.white60, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MatchCard extends StatelessWidget {
  final String home;
  final String away;
  final String score;
  final String market;

  const MatchCard({
    super.key,
    required this.home,
    required this.away,
    required this.score,
    required this.market,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF13251D),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$home  vs  $away',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              market,
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 6),
            Text(
              score,
              style: const TextStyle(
                color: Colors.greenAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

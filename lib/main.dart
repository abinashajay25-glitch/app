import 'package:flutter/material.dart';

void main() {
  runApp(const ResQonApp());
}

class ResQonApp extends StatelessWidget {
  const ResQonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RESQON',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0F14),
        fontFamily: 'Arial',
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),

                // Logo / App name
                const Text(
                  'RESQON',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  'Rescue Communication. Anywhere. Offline.',
                  style: TextStyle(color: Colors.white60, fontSize: 14),
                ),

                const SizedBox(height: 25),

                // Connection status
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF151B22),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.white12),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.wifi_off_rounded,
                        color: Colors.orange,
                        size: 28,
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Offline Mode',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Searching for nearby devices',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  'Quick Actions',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 15),

                // Push to Talk
                _ActionCard(
                  icon: Icons.mic_rounded,
                  title: 'Push to Talk',
                  subtitle: 'Hold and speak offline',
                  onTap: () {},
                ),

                const SizedBox(height: 12),

                // Voice message
                _ActionCard(
                  icon: Icons.record_voice_over_rounded,
                  title: 'Voice Message',
                  subtitle: 'Send an offline voice message',
                  onTap: () {},
                ),

                const SizedBox(height: 12),

                // Emergency
                _ActionCard(
                  icon: Icons.warning_rounded,
                  title: 'Emergency Alert',
                  subtitle: 'Send an urgent alert nearby',
                  isEmergency: true,
                  onTap: () {},
                ),

                const SizedBox(height: 25),

                // Bottom navigation
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF151B22),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _NavItem(
                        icon: Icons.home_rounded,
                        label: 'Home',
                        active: true,
                      ),
                      _NavItem(icon: Icons.chat_rounded, label: 'Chat'),
                      _NavItem(icon: Icons.history_rounded, label: 'History'),
                      _NavItem(icon: Icons.devices_rounded, label: 'Devices'),
                      _NavItem(icon: Icons.settings_rounded, label: 'Settings'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isEmergency;

  const _ActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isEmergency = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xFF151B22),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isEmergency
                ? Colors.redAccent.withValues(alpha: 0.5)
                : Colors.white12,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: isEmergency
                    ? Colors.redAccent.withValues(alpha: 0.15)
                    : Colors.white10,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                icon,
                color: isEmergency ? Colors.redAccent : Colors.white,
                size: 27,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.white38,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;

  const _NavItem({
    required this.icon,
    required this.label,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 22, color: active ? Colors.white : Colors.white38),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: active ? Colors.white : Colors.white38,
          ),
        ),
      ],
    );
  }
}

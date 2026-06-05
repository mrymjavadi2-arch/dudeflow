import 'package:flutter/material.dart';

void main() {
  runApp(const DudeFlowApp());
}

class DudeFlowApp extends StatelessWidget {
  const DudeFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DudeFlow',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E2A38),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF0F1720),
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
  String status = "همه‌چیز فعلاً نرماله 😎";
  String subStatus = "فعلاً وقت ریسک کردن نیست، فقط آرامش داشته باش!";

  void updateStatus(String newStatus, String newSubStatus) {
    setState(() {
      status = newStatus;
      subStatus = newSubStatus;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(newStatus),
        backgroundColor: const Color(0xFF243447),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Widget featureCard({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
    Color accent = const Color(0xFF4CC9F0),
  }) {
    return Card(
      elevation: 0,
      color: const Color(0xFF17212B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: accent.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: accent, size: 30),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.72),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget quickButton(String label, IconData icon, Color color, VoidCallback onTap) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4CC9F0), Color(0xFF7B2CBF)],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.man, color: Colors.white, size: 30),
                  ),
                  const SizedBox(width: 14),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DudeFlow',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'اپِ مدیریتِ حالِ داداش‌ها 😎',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1D3557), Color(0xFF0F1720)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'وضعیت امروز',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      status,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      subStatus,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              featureCard(
                icon: Icons.notifications_active,
                title: 'هشدار مین‌گذاری',
                description: 'می‌فهمد امروز بحث کردن ایده‌ی خوبی نیست.',
                accent: const Color(0xFFFF6B6B),
                onTap: () {
                  updateStatus(
                    "هشدار قرمز: امروز فقط بگو چشم ✅",
                    "این روزها بهترین استراتژی، سکوتِ حرفه‌ایه.",
                  );
                },
              ),

              featureCard(
                icon: Icons.shopping_cart_checkout,
                title: 'خرید اضطراری',
                description: 'شکلات، پیتزا، بستنی و هر چیزی که اوضاع را نرم کند.',
                accent: const Color(0xFFFFC857),
                onTap: () {
                  updateStatus(
                    "سبد خرید اضطراری آماده شد 🛒",
                    "شکلات + پیتزا = صلح جهانی",
                  );
                },
              ),

              featureCard(
                icon: Icons.translate,
                title: 'ترجمه به زبان داداشی',
                description: 'جملات پیچیده را به نسخه‌ی قابل‌فهم تبدیل می‌کند.',
                accent: const Color(0xFF4CC9F0),
                onTap: () {
                  updateStatus(
                    "ترجمه انجام شد: «هرطور راحتی» = «خودت می‌دونی، ولی بهتره درست انتخاب کنی» 😅",
                    "مترجم حرفه‌ایِ رابطه فعال شد.",
                  );
                },
              ),

              featureCard(
                icon: Icons.snooze,
                title: 'یادآور صبر',
                description: 'هر ۲ ساعت یک‌بار یادآوری می‌کند که آرام باشی.',
                accent: const Color(0xFF80ED99),
                onTap: () {
                  updateStatus(
                    "یادآور صبر فعال شد ⏳",
                    "نفس عمیق بکش، آب بخور، و بحث را به زمان دیگری موکول کن.",
                  );
                },
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  quickButton(
                    "حالت امن",
                    Icons.shield,
                    const Color(0xFF2A9D8F),
                    () {
                      updateStatus(
                        "حالت امن فعال شد 🛡️",
                        "امروز فقط لبخند بزن و جلو برو.",
                      );
                    },
                  ),
                  const SizedBox(width: 12),
                  quickButton(
                    "SOS",
                    Icons.warning_amber,
                    const Color(0xFFE76F51),
                    () {
                      updateStatus(
                        "SOS صادر شد 🚨",
                        "فوراً شکلات تهیه کنید و عقب‌نشینی تاکتیکی داشته باشید!",
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 24),

              const Text(
                'نکته مهم',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'این اپ فقط برای طنز است و کاربرد واقعی پزشکی یا تشخیصی ندارد 😄',
                style: TextStyle(color: Colors.white.withOpacity(0.75)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

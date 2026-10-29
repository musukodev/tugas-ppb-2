import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/app_icon.dart';
import '../widgets/splash_pattern_painter.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(builder: (_) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(painter: SplashPatternPainter()),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppIcon(size: 72),
                    const SizedBox(height: 24),
                    Text(
                      'CatatanKu',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(height: 12),
                    const SizedBox(
                      width: 245,
                      child: Text(
                        'Simpan setiap ide, rencana, dan momen berharga dalam satu tempat.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.muted, height: 1.5),
                      ),
                    ),
                    const SizedBox(height: 56),
                    const SizedBox(
                      width: 86,
                      child: LinearProgressIndicator(
                        minHeight: 6,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        backgroundColor: AppColors.greenSoft,
                        color: AppColors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

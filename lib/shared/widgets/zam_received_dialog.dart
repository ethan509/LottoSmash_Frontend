import 'dart:math';
import 'package:flutter/material.dart';

class ZamReceivedDialog extends StatefulWidget {
  final int zamAmount;
  final bool isWelcome; // 최초 지급(가입) vs 일일 보너스

  const ZamReceivedDialog({
    super.key,
    required this.zamAmount,
    this.isWelcome = false,
  });

  static Future<void> show(
    BuildContext context, {
    required int zamAmount,
    bool isWelcome = false,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black54,
      builder: (_) => ZamReceivedDialog(
        zamAmount: zamAmount,
        isWelcome: isWelcome,
      ),
    );
  }

  @override
  State<ZamReceivedDialog> createState() => _ZamReceivedDialogState();
}

class _ZamReceivedDialogState extends State<ZamReceivedDialog>
    with TickerProviderStateMixin {
  late final AnimationController _enterController;
  late final AnimationController _pulseController;
  late final AnimationController _sparkleController;

  late final Animation<double> _scaleAnim;
  late final Animation<double> _fadeAnim;
  late final Animation<double> _pulseAnim;
  late final Animation<double> _sparkleAnim;
  late final Animation<double> _slideAnim;

  @override
  void initState() {
    super.initState();

    _enterController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat(reverse: true);
    _sparkleController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();

    _scaleAnim = CurvedAnimation(
      parent: _enterController,
      curve: Curves.elasticOut,
    );
    _fadeAnim = CurvedAnimation(
      parent: _enterController,
      curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
    );
    _slideAnim = Tween<double>(begin: 40, end: 0).animate(
      CurvedAnimation(
        parent: _enterController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );
    _pulseAnim = Tween<double>(begin: 1.0, end: 1.12).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    _sparkleAnim = CurvedAnimation(
      parent: _sparkleController,
      curve: Curves.linear,
    );

    _enterController.forward();
  }

  @override
  void dispose() {
    _enterController.dispose();
    _pulseController.dispose();
    _sparkleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnim,
      child: AnimatedBuilder(
        animation: _slideAnim,
        builder: (_, child) => Transform.translate(
          offset: Offset(0, _slideAnim.value),
          child: child,
        ),
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: ScaleTransition(
            scale: _scaleAnim,
            child: _buildContent(context),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        // 메인 카드
        Container(
          margin: const EdgeInsets.only(top: 44),
          padding: const EdgeInsets.fromLTRB(28, 60, 28, 28),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: Colors.amber.withValues(alpha: 0.6),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.amber.withValues(alpha: 0.35),
                blurRadius: 40,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 제목
              Text(
                widget.isWelcome ? '🎉 환영 보너스 지급!' : '🎁 일일 보너스 지급!',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 20),

              // ZAM 금액 (반짝이는 그라데이션 텍스트)
              AnimatedBuilder(
                animation: _pulseAnim,
                builder: (_, child) => Transform.scale(
                  scale: _pulseAnim.value,
                  child: child,
                ),
                child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color(0xFFFDD835),
                      Color(0xFFFFB300),
                      Color(0xFFFDD835),
                    ],
                  ).createShader(bounds),
                  child: Text(
                    '+${widget.zamAmount} Zam',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 44,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // 설명 문구
              Text(
                widget.isWelcome
                    ? '가입을 축하드려요!\nZam으로 다양한 기능을 즐겨보세요.'
                    : '매일 접속하면 Zam을 드려요!\n내일도 꼭 방문해주세요.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.75),
                  fontSize: 14,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 28),

              // 반짝이는 선
              _buildSparkleRow(),
              const SizedBox(height: 20),

              // 확인 버튼
              SizedBox(
                width: double.infinity,
                height: 48,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFDD835), Color(0xFFFFB300)],
                    ),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.amber.withValues(alpha: 0.5),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF1A1A2E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      '감사합니다!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // 코인 아이콘 (상단 오버랩)
        AnimatedBuilder(
          animation: _pulseAnim,
          builder: (_, child) => Transform.scale(
            scale: _pulseAnim.value,
            child: child,
          ),
          child: Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFDD835), Color(0xFFFFB300)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.amber.withValues(alpha: 0.6),
                  blurRadius: 24,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: const Center(
              child: Text('🪙', style: TextStyle(fontSize: 42)),
            ),
          ),
        ),

        // 반짝이는 별들 (주변 장식)
        ..._buildSparkles(),
      ],
    );
  }

  Widget _buildSparkleRow() {
    return AnimatedBuilder(
      animation: _sparkleAnim,
      builder: (ctx, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (i) {
            final phase = (i / 5 + _sparkleAnim.value) % 1.0;
            final opacity = (sin(phase * 2 * pi) * 0.5 + 0.5).clamp(0.2, 1.0);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Opacity(
                opacity: opacity,
                child: Icon(
                  Icons.star,
                  size: 14,
                  color: Colors.amber.withValues(alpha: opacity),
                ),
              ),
            );
          }),
        );
      },
    );
  }

  List<Widget> _buildSparkles() {
    const positions = [
      Offset(-30, 60),
      Offset(30, 30),
      Offset(-20, 140),
      Offset(120, 80),
      Offset(-90, 100),
    ];
    const icons = [
      Icons.auto_awesome,
      Icons.star,
      Icons.auto_awesome,
      Icons.star,
      Icons.auto_awesome,
    ];

    return List.generate(positions.length, (i) {
      return AnimatedBuilder(
        animation: _sparkleAnim,
        builder: (ctx, child) {
          final phase = (i / positions.length + _sparkleAnim.value) % 1.0;
          final opacity =
              (sin(phase * 2 * pi) * 0.5 + 0.5).clamp(0.0, 1.0);
          final size = 14.0 + 6 * sin(phase * 2 * pi + 1).abs();
          return Positioned(
            left: 140 + positions[i].dx,
            top: 44 + positions[i].dy,
            child: Opacity(
              opacity: opacity * 0.8,
              child: Icon(
                icons[i],
                size: size,
                color: Colors.amber,
              ),
            ),
          );
        },
      );
    });
  }
}

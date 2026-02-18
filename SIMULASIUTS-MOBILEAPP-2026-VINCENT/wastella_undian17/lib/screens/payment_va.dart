import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'payment_confirm.dart';

class PaymentConfirmationScreen extends StatefulWidget {
  final int amount;
  final String method;
  const PaymentConfirmationScreen({
    super.key,
    required this.amount,
    required this.method,
  });
  @override
  State<PaymentConfirmationScreen> createState() =>
      _PaymentConfirmationScreenState();
}

class _PaymentConfirmationScreenState extends State<PaymentConfirmationScreen> {
  late Timer _timer;
  int _seconds = 22 * 3600 + 50 * 60 + 30;
  bool _copied = false;

  final String _vaNumber = '192 0851 3624 9696';

  String _fmt(int val) {
    final s = val.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]}.',
    );
    return s;
  }

  String get _timeLeft {
    final h = _seconds ~/ 3600;
    final m = (_seconds % 3600) ~/ 60;
    final s = _seconds % 60;
    return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  String get _methodLabel {
    switch (widget.method) {
      case 'bri':
        return 'BRI';
      case 'mandiri':
        return 'Mandiri';
      default:
        return 'BCA';
    }
  }

  String get _bankLogo {
    switch (widget.method) {
      case 'bri':
        return 'assets/images/bri.png';
      case 'mandiri':
        return 'assets/images/mandiri.png';
      default:
        return 'assets/images/bca.png';
    }
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_seconds > 0) setState(() => _seconds--);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment Confirmation',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // VA Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        _bankLogo,
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        _methodLabel,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF1565C0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Virtual Account Number',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        _vaNumber,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: _vaNumber));
                          setState(() => _copied = true);
                          Future.delayed(
                            const Duration(seconds: 2),
                            () => setState(() => _copied = false),
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: _copied
                                ? const Color(0xFF2E7D32)
                                : const Color(0xFFE8F5E9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            _copied ? 'Copied!' : 'Copy',
                            style: TextStyle(
                              color: _copied
                                  ? Colors.white
                                  : const Color(0xFF2E7D32),
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF3E0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Expires in $_timeLeft',
                          style: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Summary card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _SummaryRow('Nama Merchant', 'WWW.WASTELLY.COM'),
                  const Divider(height: 20),
                  _SummaryRow(
                    'Total',
                    'Rp ${_fmt(widget.amount)}',
                    valueStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF2E7D32),
                    ),
                  ),
                  const Divider(height: 20),
                  _SummaryRow('Due Date', '25 March 2025, 04:00 PM'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Transfer guides
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _GuideItem('mBanking Transfer Guide'),
                  const Divider(height: 1),
                  _GuideItem('iBanking Transfer Guide'),
                  const Divider(height: 1),
                  _GuideItem('ATM Transfer Guide'),
                ],
              ),
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PaymentConfirmScreen(
                          amount: widget.amount,
                          method: widget.method,
                        ),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF234968), Color(0xFF2E8B57)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF2E7D32).withOpacity(0.4),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Check Status',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? valueStyle;
  const _SummaryRow(this.label, this.value, {this.valueStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.black54, fontSize: 13),
        ),
        Text(
          value,
          style:
              valueStyle ??
              const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
      ],
    );
  }
}

class _GuideItem extends StatefulWidget {
  final String title;
  const _GuideItem(this.title);
  @override
  State<_GuideItem> createState() => _GuideItemState();
}

class _GuideItemState extends State<_GuideItem> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        widget.title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(
        _expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
      ),
      onExpansionChanged: (v) => setState(() => _expanded = v),
      children: const [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: Text(
            '1. Open your banking app\n2. Go to Transfer > Virtual Account\n3. Enter the VA number above\n4. Confirm the amount and complete payment',
            style: TextStyle(fontSize: 13, color: Colors.black54, height: 1.6),
          ),
        ),
      ],
    );
  }
}

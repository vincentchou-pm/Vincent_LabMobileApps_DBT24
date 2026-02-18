import 'dart:async';
import 'package:flutter/material.dart';
import 'payment_successful.dart';

class PaymentConfirmScreen extends StatefulWidget {
  final int amount;
  final String method;
  const PaymentConfirmScreen({
    super.key,
    required this.amount,
    required this.method,
  });

  @override
  State<PaymentConfirmScreen> createState() => _PaymentConfirmScreenState();
}

class _PaymentConfirmScreenState extends State<PaymentConfirmScreen> {
  late Timer _timer;
  int _seconds = 5 * 60 + 29; // 5:29
  final TextEditingController _authCodeCtrl = TextEditingController();

  String get _timeLeft {
    final m = _seconds ~/ 60;
    final s = _seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  String _fmt(int val) {
    final s = val.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]}.',
    );
    return 'IDR $s,00';
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
    _authCodeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Payment Confirmation',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bank Logo and ID Check
            Row(
              children: [
                Image.asset(
                  _bankLogo,
                  width: 60,
                  height: 40,
                  fit: BoxFit.contain,
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 16,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.red, Colors.orange],
                          ),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'ID Check',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Info Text
            const Text(
              'Kode autentikasi telah dikirim ke no HP Anda (4 digit terakhir 9696). Mohon masukkan Kode Otentikasi untuk konfirmasi atau Anda menunggu waktu habis.',
              style: TextStyle(fontSize: 11, color: Colors.black87),
            ),
            const SizedBox(height: 12),

            // Timer
            Text(
              'Sisa waktu: $_timeLeft',
              style: const TextStyle(
                fontSize: 13,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Merchant Details
            _buildDetailRow('Nama Merchant', 'WWW.WASTELLA.COM'),
            const Divider(height: 20),
            _buildDetailRow('Jumlah', _fmt(widget.amount)),
            const Divider(height: 20),
            _buildDetailRow(
              'Tanggal Transaksi',
              'Senin, 24 Mar 2025\n19:43:20 GMT +0700',
            ),
            const Divider(height: 20),
            _buildDetailRow(
              'Nomor $_methodLabel Mastercard',
              '****-****-****-3251',
            ),
            const Divider(height: 20),

            // Authentication Code Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kode Otentikasi Mastercard',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _authCodeCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      side: BorderSide(color: Colors.grey.shade400),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text(
                      'Batalkan',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      side: BorderSide(color: Colors.grey.shade400),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text(
                      'Kirim Ulang Kode Otentikasi',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PaymentSuccessScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1565C0),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Warning Message
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'OTP bersifat rahasia, jangan beritahu siapapun.',
                    style: TextStyle(
                      color: Colors.red.shade700,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Hubungi Halo $_methodLabel untuk bantuan',
                    style: TextStyle(color: Colors.red.shade700, fontSize: 11),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildContactItem(Icons.phone, '1500888'),
                      const SizedBox(width: 16),
                      _buildContactItem(Icons.chat_bubble_outline, 'Chat BCA'),
                      const SizedBox(width: 16),
                      _buildContactItem(Icons.storefront, 'Kunjungi BCA'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ),
        const Text(': ', style: TextStyle(fontSize: 12)),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.red.shade700),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(fontSize: 10, color: Colors.red.shade700)),
      ],
    );
  }
}

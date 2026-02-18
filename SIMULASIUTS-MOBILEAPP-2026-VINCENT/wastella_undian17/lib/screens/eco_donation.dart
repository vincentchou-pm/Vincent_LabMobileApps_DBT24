import 'package:flutter/material.dart';
import '../main.dart';
import 'payment_va.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});
  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  int? _selectedAmount;
  final TextEditingController _customCtrl = TextEditingController();
  String _paymentMethod = 'bca';
  final TextEditingController _hopeCtrl = TextEditingController();

  final List<int> _amounts = [10000, 20000, 50000, 100000];

  String _fmt(int val) {
    final s = val.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]}.',
    );
    return s;
  }

  int get _finalAmount {
    if (_selectedAmount != null) return _selectedAmount!;
    final v = int.tryParse(_customCtrl.text.replaceAll('.', ''));
    return v ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          // Green header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 10),
            decoration: const BoxDecoration(color: Color(0xFF2E8B57)),
            child: Column(
              children: [
                WastellyLogo(size: 70),
                const SizedBox(height: 1),
                const Text(
                  'Make a Difference Today',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Choose your donation amount',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const SizedBox(height: 14),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 3.2,
                    children: _amounts.map((a) {
                      final selected = _selectedAmount == a;
                      return GestureDetector(
                        onTap: () => setState(() {
                          _selectedAmount = a;
                          _customCtrl.text = _fmt(a);
                        }),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: selected
                                  ? const Color(0xFF2E8B57)
                                  : Colors.grey.shade300,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            _fmt(a),
                            style: TextStyle(
                              color: selected
                                  ? const Color(0xFF2E8B57)
                                  : Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Enter donation amount',
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _customCtrl,
                    keyboardType: TextInputType.number,
                    onChanged: (_) => setState(() => _selectedAmount = null),
                    decoration: InputDecoration(
                      prefixText: 'Rp  ',
                      hintText: '0',
                      helperText: 'Min. donation Rp10.000',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xFF2E8B57),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'Payment Method',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  ...[
                    {
                      'key': 'bca',
                      'label': 'BCA Virtual Account',
                      'asset': 'assets/images/bca.png',
                    },
                    {
                      'key': 'bri',
                      'label': 'BRI Virtual Account',
                      'asset': 'assets/images/bri.png',
                    },
                    {
                      'key': 'mandiri',
                      'label': 'Mandiri Virtual Account',
                      'asset': 'assets/images/mandiri.png',
                    },
                  ].map((m) {
                    final selected = _paymentMethod == m['key'];
                    return GestureDetector(
                      onTap: () =>
                          setState(() => _paymentMethod = m['key'] as String),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: selected
                              ? const Color(0xFFE8F5E9)
                              : Colors.white,
                          border: Border.all(
                            color: selected
                                ? const Color(0xFF2E8B57)
                                : Colors.grey.shade300,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              m['asset'] as String,
                              width: 40,
                              height: 40,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              m['label'] as String,
                              style: TextStyle(
                                fontWeight: selected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: Colors.black87,
                              ),
                            ),
                            const Spacer(),
                            Radio<String>(
                              value: m['key'] as String,
                              groupValue: _paymentMethod,
                              activeColor: const Color(0xFF2E8B57),
                              onChanged: (v) =>
                                  setState(() => _paymentMethod = v!),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 22),
                  const Text(
                    'Word of hope',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _hopeCtrl,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Ex: Use this money wisely...',
                      hintStyle: const TextStyle(color: Colors.black38),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xFF2E8B57),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: _finalAmount >= 10000
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => PaymentConfirmationScreen(
                                      amount: _finalAmount,
                                      method: _paymentMethod,
                                    ),
                                  ),
                                );
                              }
                            : null,
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
                                color: const Color(0xFF2E8B57).withOpacity(0.4),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'Donate Now',
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
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeType _currentTheme = ThemeType.putihBiru;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alat Hitung Waktu Sterilisasi',
      theme: _getTheme(_currentTheme),
      home: MyHomePage(
        onThemeChanged: (theme) {
          setState(() {
            _currentTheme = theme;
          });
        },
        currentTheme: _currentTheme,
      ),
    );
  }

  ThemeData _getTheme(ThemeType themeType) {
    switch (themeType) {
      case ThemeType.cokelatOrange:
        return ThemeData(
          primaryColor: const Color(0xFFD2691E),
          scaffoldBackgroundColor: const Color(0xFFF8F4EA),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: const Color(0xFFEAE0D7),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFD2B48C)),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFD2691E)),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          cardColor: const Color(0xFFEAE0D7),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFF4A2C2A)),
            headlineSmall: TextStyle(color: Color(0xFFD2691E)),
          ),
        );
      case ThemeType.putihBiru:
        return ThemeData(
          primaryColor: const Color(0xFF0288D1),
          scaffoldBackgroundColor: const Color(0xFFE0F7FA),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFBBDEFB)),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF0288D1)),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          cardColor: Colors.white,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFF01579B)),
            headlineSmall: TextStyle(color: Color(0xFF0288D1)),
          ),
        );
      case ThemeType.hijauLaut:
        return ThemeData(
          primaryColor: const Color(0xFF20B2AA),
          scaffoldBackgroundColor: const Color(0xFFE0FFFF),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: const Color(0xFFF0FFFF),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF98FB98)),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF20B2AA)),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          cardColor: const Color(0xFFF0FFFF),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFF008080)),
            headlineSmall: TextStyle(color: Color(0xFF20B2AA)),
          ),
        );
      case ThemeType.biruTosca:
        return ThemeData(
          primaryColor: const Color(0xFF0097A7),
          scaffoldBackgroundColor: const Color(0xFFB2EBF2),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: const Color(0xFFE0F7FA),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF80DEEA)),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF0097A7)),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          cardColor: const Color(0xFFE0F7FA),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFF004D40)),
            headlineSmall: TextStyle(color: Color(0xFF0097A7)),
          ),
        );
      case ThemeType.black:
        return ThemeData(
          primaryColor: const Color(0xFF64FFDA),
          scaffoldBackgroundColor: const Color(0xFF121212),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: const Color(0xFF1E1E1E),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF333333)),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF64FFDA)),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          cardColor: const Color(0xFF1E1E1E),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFFE0E0E0)),
            headlineSmall: TextStyle(color: Color(0xFF64FFDA)),
          ),
        );
    }
  }
}

enum ThemeType { cokelatOrange, putihBiru, hijauLaut, biruTosca, black }

class MyHomePage extends StatefulWidget {
  final Function(ThemeType) onThemeChanged;
  final ThemeType currentTheme;

  const MyHomePage({
    super.key,
    required this.onThemeChanged,
    required this.currentTheme,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Cooling Time Controllers
  final _startHourController = TextEditingController();
  final _startMinuteController = TextEditingController();
  final _startSecondController = TextEditingController();
  final _endHourController = TextEditingController();
  final _endMinuteController = TextEditingController();
  final _endSecondController = TextEditingController();

  // Difference Controllers
  final _tempA102Controller = TextEditingController();
  final _tempA125Controller = TextEditingController();
  final _pressureA106Controller = TextEditingController();
  final _pressureA129Controller = TextEditingController();

  // Steril Time Controllers
  final _sterilStartController = TextEditingController();
  final _sterilHourController = TextEditingController();
  final _sterilMinuteController = TextEditingController();
  final _sterilSecondController = TextEditingController();

  // Delay Time Controllers
  final _fvStartController = TextEditingController();
  final _delayMixingController = TextEditingController();
  final _delaySterilisasiController = TextEditingController();

  // Result variables
  String _coolingResult = '';
  bool _showCoolingResult = false;

  String _tempDifference = '';
  String _pressureDifference = '';
  bool _showDifferenceResult = false;

  String _sterilStartDisplay = '';
  String _sterilDurationDisplay = '';
  String _sterilEndDisplay = '';
  bool _showSterilResult = false;

  String _mixingResult = '';
  String _sterilisasiResult = '';
  String _totalDelay = '';
  bool _showDelayResult = false;

  @override
  void initState() {
    super.initState();
    // Set default datetime-local values to now
    final now = DateTime.now();
    final formattedNow =
        '${now.year}-${_formatTwoDigits(now.month)}-${_formatTwoDigits(now.day)}T${_formatTwoDigits(now.hour)}:${_formatTwoDigits(now.minute)}';
    _sterilStartController.text = formattedNow;
    _fvStartController.text = formattedNow;
  }

  String _formatTwoDigits(int number) {
    return number.toString().padLeft(2, '0');
  }

  String _formatTanggal(DateTime date) {
    final bulan = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "Mei",
      "Jun",
      "Jul",
      "Agu",
      "Sep",
      "Okt",
      "Nov",
      "Des",
    ];

    return '${_formatTwoDigits(date.day)} ${bulan[date.month - 1]} ${date.year} jam ${_formatTwoDigits(date.hour)}.${_formatTwoDigits(date.minute)}';
  }

  String _hitungSelisihWaktu(
    int startHour,
    int startMinute,
    int startSecond,
    int endHour,
    int endMinute,
    int endSecond,
  ) {
    int startTotalDetik = startHour * 3600 + startMinute * 60 + startSecond;
    int endTotalDetik = endHour * 3600 + endMinute * 60 + endSecond;

    if (endTotalDetik < startTotalDetik) {
      endTotalDetik += 24 * 3600;
    }

    final selisihDetik = endTotalDetik - startTotalDetik;

    final jam = selisihDetik ~/ 3600;
    final sisaDetik = selisihDetik % 3600;
    final menit = sisaDetik ~/ 60;
    final detik = sisaDetik % 60;

    String hasil = "";
    if (jam > 0) {
      hasil += "$jam jam ";
    }
    if (menit > 0 || jam > 0) {
      hasil += "$menit menit ";
    }
    hasil += "$detik detik";

    return hasil;
  }

  void _calculateCooling() {
    try {
      final startHour = int.parse(
        _startHourController.text.isEmpty ? '0' : _startHourController.text,
      );
      final startMinute = int.parse(
        _startMinuteController.text.isEmpty ? '0' : _startMinuteController.text,
      );
      final startSecond = int.parse(
        _startSecondController.text.isEmpty ? '0' : _startSecondController.text,
      );

      final endHour = int.parse(
        _endHourController.text.isEmpty ? '0' : _endHourController.text,
      );
      final endMinute = int.parse(
        _endMinuteController.text.isEmpty ? '0' : _endMinuteController.text,
      );
      final endSecond = int.parse(
        _endSecondController.text.isEmpty ? '0' : _endSecondController.text,
      );

      if (startHour < 0 ||
          startHour > 23 ||
          endHour < 0 ||
          endHour > 23 ||
          startMinute < 0 ||
          startMinute > 59 ||
          endMinute < 0 ||
          endMinute > 59 ||
          startSecond < 0 ||
          startSecond > 59 ||
          endSecond < 0 ||
          endSecond > 59) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Mohon isi waktu dengan benar! Jam (0-23), Menit (0-59), Detik (0-59)',
            ),
          ),
        );
        return;
      }

      setState(() {
        _coolingResult = _hitungSelisihWaktu(
          startHour,
          startMinute,
          startSecond,
          endHour,
          endMinute,
          endSecond,
        );
        _showCoolingResult = true;
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Input tidak valid')));
    }
  }

  void _resetCooling() {
    setState(() {
      _startHourController.clear();
      _startMinuteController.clear();
      _startSecondController.clear();
      _endHourController.clear();
      _endMinuteController.clear();
      _endSecondController.clear();
      _showCoolingResult = false;
    });
  }

  void _calculateDifference() {
    try {
      bool hasTemp =
          _tempA102Controller.text.isNotEmpty &&
          _tempA125Controller.text.isNotEmpty;
      bool hasPressure =
          _pressureA106Controller.text.isNotEmpty &&
          _pressureA129Controller.text.isNotEmpty;

      if (!hasTemp && !hasPressure) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Mohon isi setidaknya pasangan nilai Suhu atau Tekanan untuk menghitung selisih.',
            ),
          ),
        );
        return;
      }

      String tempDiff = '';
      if (hasTemp) {
        final tempA102 = double.parse(_tempA102Controller.text);
        final tempA125 = double.parse(_tempA125Controller.text);
        final diff = (tempA102 - tempA125).abs();
        tempDiff = '${diff.toStringAsFixed(1)} °C';
      } else {
        tempDiff = 'N/A';
      }

      String pressureDiff = '';
      if (hasPressure) {
        final pressureA106 = double.parse(_pressureA106Controller.text);
        final pressureA129 = double.parse(_pressureA129Controller.text);
        final diff = (pressureA106 - pressureA129).abs();
        pressureDiff = '${diff.toStringAsFixed(3)} bar';
      } else {
        pressureDiff = 'N/A';
      }

      setState(() {
        _tempDifference = tempDiff;
        _pressureDifference = pressureDiff;
        _showDifferenceResult = true;
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Input tidak valid')));
    }
  }

  void _resetDifference() {
    setState(() {
      _tempA102Controller.clear();
      _tempA125Controller.clear();
      _pressureA106Controller.clear();
      _pressureA129Controller.clear();
      _showDifferenceResult = false;
    });
  }

  void _calculateSterilTime() {
    try {
      if (_sterilStartController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Mohon isi Jam Mulai Steril!')),
        );
        return;
      }

      final durationHour = int.parse(
        _sterilHourController.text.isEmpty ? '0' : _sterilHourController.text,
      );
      final durationMinute = int.parse(
        _sterilMinuteController.text.isEmpty
            ? '0'
            : _sterilMinuteController.text,
      );
      final durationSecond = int.parse(
        _sterilSecondController.text.isEmpty
            ? '0'
            : _sterilSecondController.text,
      );

      if (durationMinute < 0 ||
          durationMinute > 59 ||
          durationSecond < 0 ||
          durationSecond > 59) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Mohon isi Menit dan Detik Durasi Steril dengan benar (0-59)!',
            ),
          ),
        );
        return;
      }

      final startDate = DateTime.parse(_sterilStartController.text);
      final totalDurationMs =
          (durationHour * 3600 + durationMinute * 60 + durationSecond) * 1000;
      final endDate = startDate.add(Duration(milliseconds: totalDurationMs));

      final durationDisplay =
          '${_formatTwoDigits(durationHour)} jam ${_formatTwoDigits(durationMinute)} menit ${_formatTwoDigits(durationSecond)} detik';

      setState(() {
        _sterilStartDisplay = _formatTanggal(startDate);
        _sterilDurationDisplay = durationDisplay;
        _sterilEndDisplay = _formatTanggal(endDate);
        _showSterilResult = true;
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Input tidak valid')));
    }
  }

  void _resetSterilTime() {
    setState(() {
      _sterilStartController.clear();
      _sterilHourController.clear();
      _sterilMinuteController.clear();
      _sterilSecondController.clear();
      _showSterilResult = false;
    });
  }

  void _calculateDelay() {
    try {
      if (_fvStartController.text.isEmpty ||
          _delayMixingController.text.isEmpty ||
          _delaySterilisasiController.text.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Mohon isi semua field!')));
        return;
      }

      final startDate = DateTime.parse(_fvStartController.text);
      final delayMixing = double.parse(_delayMixingController.text);
      final delaySterilisasi = double.parse(_delaySterilisasiController.text);

      final mixingDate = startDate.add(
        Duration(
          hours: delayMixing.toInt(),
          minutes: ((delayMixing % 1) * 60).toInt(),
        ),
      );
      final sterilisasiDate = startDate.add(
        Duration(
          hours: delaySterilisasi.toInt(),
          minutes: ((delaySterilisasi % 1) * 60).toInt(),
        ),
      );
      final totalDelay = delayMixing + delaySterilisasi;

      setState(() {
        _mixingResult = _formatTanggal(mixingDate);
        _sterilisasiResult = _formatTanggal(sterilisasiDate);
        _totalDelay = '$totalDelay jam';
        _showDelayResult = true;
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Input tidak valid')));
    }
  }

  void _resetDelay() {
    setState(() {
      _fvStartController.clear();
      _delayMixingController.clear();
      _delaySterilisasiController.clear();
      _showDelayResult = false;
    });
  }

  @override
  void dispose() {
    _startHourController.dispose();
    _startMinuteController.dispose();
    _startSecondController.dispose();
    _endHourController.dispose();
    _endMinuteController.dispose();
    _endSecondController.dispose();
    _tempA102Controller.dispose();
    _tempA125Controller.dispose();
    _pressureA106Controller.dispose();
    _pressureA129Controller.dispose();
    _sterilStartController.dispose();
    _sterilHourController.dispose();
    _sterilMinuteController.dispose();
    _sterilSecondController.dispose();
    _fvStartController.dispose();
    _delayMixingController.dispose();
    _delaySterilisasiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alat Hitung Waktu Sterilisasi'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              children: [
                // Theme Selector
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildThemeButton(
                      'Cokelat Orange',
                      ThemeType.cokelatOrange,
                    ),
                    _buildThemeButton('Putih Biru', ThemeType.putihBiru),
                    _buildThemeButton('Hijau Laut', ThemeType.hijauLaut),
                    _buildThemeButton('Biru Tosca', ThemeType.biruTosca),
                    _buildThemeButton('Black', ThemeType.black),
                  ],
                ),
                const SizedBox(height: 30),

                // Menghitung Waktu Cooling
                _buildCard(
                  title: 'Menghitung Waktu Cooling',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTimeInputGroup(
                        label: 'Waktu Mulai',
                        hourController: _startHourController,
                        minuteController: _startMinuteController,
                        secondController: _startSecondController,
                      ),
                      const SizedBox(height: 20),
                      _buildTimeInputGroup(
                        label: 'Waktu Selesai',
                        hourController: _endHourController,
                        minuteController: _endMinuteController,
                        secondController: _endSecondController,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _calculateCooling,
                              child: const Text('Hitung Waktu Cooling'),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: _resetCooling,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            child: const Text('Reset'),
                          ),
                        ],
                      ),
                      if (_showCoolingResult) ...[
                        const SizedBox(height: 20),
                        _buildResultBox(
                          title: 'Hasil Perhitungan',
                          children: [
                            Text(
                              'Mulai: ${_formatTwoDigits(int.parse(_startHourController.text.isEmpty ? '0' : _startHourController.text))}.${_formatTwoDigits(int.parse(_startMinuteController.text.isEmpty ? '0' : _startMinuteController.text))}.${_formatTwoDigits(int.parse(_startSecondController.text.isEmpty ? '0' : _startSecondController.text))}',
                            ),
                            Text(
                              'Selesai: ${_formatTwoDigits(int.parse(_endHourController.text.isEmpty ? '0' : _endHourController.text))}.${_formatTwoDigits(int.parse(_endMinuteController.text.isEmpty ? '0' : _endMinuteController.text))}.${_formatTwoDigits(int.parse(_endSecondController.text.isEmpty ? '0' : _endSecondController.text))}',
                            ),
                            Text(
                              'Waktu Cooling: $_coolingResult',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                // Hitung Selisih Suhu dan Tekanan
                _buildCard(
                  title: 'Hitung Selisih Suhu dan Tekanan',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildNumberInputPair(
                        label1: 'Suhu A102 (°C)',
                        controller1: _tempA102Controller,
                        label2: 'Suhu A125 (°C)',
                        controller2: _tempA125Controller,
                      ),
                      const SizedBox(height: 20),
                      _buildNumberInputPair(
                        label1: 'Tekanan A106 (bar)',
                        controller1: _pressureA106Controller,
                        label2: 'Tekanan A129 (bar)',
                        controller2: _pressureA129Controller,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _calculateDifference,
                              child: const Text('Hitung Selisih'),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: _resetDifference,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            child: const Text('Reset'),
                          ),
                        ],
                      ),
                      if (_showDifferenceResult) ...[
                        const SizedBox(height: 20),
                        _buildResultBox(
                          title: 'Hasil Selisih',
                          children: [
                            Text('Selisih Suhu: $_tempDifference'),
                            Text('Selisih Tekanan: $_pressureDifference'),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                // Perhitungan Lama Waktu Steril
                _buildCard(
                  title: 'Perhitungan Lama Waktu Steril',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabeledInput(
                        label: 'Jam Mulai Steril',
                        controller: _sterilStartController,
                        keyboardType: TextInputType.datetime,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Lama Waktu Steril (Jam:Menit:Detik)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      _buildTimeInputGroup(
                        label: '',
                        hourController: _sterilHourController,
                        minuteController: _sterilMinuteController,
                        secondController: _sterilSecondController,
                        showLabel: false,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _calculateSterilTime,
                              child: const Text('Hitung Waktu Steril'),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: _resetSterilTime,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            child: const Text('Reset'),
                          ),
                        ],
                      ),
                      if (_showSterilResult) ...[
                        const SizedBox(height: 20),
                        _buildResultBox(
                          title: 'Hasil Perhitungan Steril',
                          children: [
                            Text('Mulai Steril: $_sterilStartDisplay'),
                            Text('Lama Steril: $_sterilDurationDisplay'),
                            const SizedBox(height: 10),
                            Text(
                              'Jam Selesai Steril: $_sterilEndDisplay',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                // Delay Time Mixing & Sterilisasi
                _buildCard(
                  title: 'Delay Time Mixing & Sterilisasi',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabeledInput(
                        label: 'Tanggal & Jam Mulai FV',
                        controller: _fvStartController,
                        keyboardType: TextInputType.datetime,
                      ),
                      const SizedBox(height: 20),
                      _buildLabeledInput(
                        label: 'Batas Jam Delay Time Mixing (jam)',
                        controller: _delayMixingController,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20),
                      _buildLabeledInput(
                        label: 'Batas Jam Delay Time Sterilisasi (jam)',
                        controller: _delaySterilisasiController,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _calculateDelay,
                              child: const Text('Hitung Delay Time'),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: _resetDelay,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            child: const Text('Reset'),
                          ),
                        ],
                      ),
                      if (_showDelayResult) ...[
                        const SizedBox(height: 20),
                        _buildResultBox(
                          title: 'Hasil Perhitungan',
                          children: [
                            Text('Delay time mixing: $_mixingResult'),
                            Text('Delay time sterilisasi: $_sterilisasiResult'),
                            const SizedBox(height: 10),
                            Text(
                              'Total waktu delay: $_totalDelay',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Footer
                Text(
                  '© 2025 Aplikasi Alat Hitung Waktu Sterilisasi',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildThemeButton(String label, ThemeType theme) {
    final isActive = widget.currentTheme == theme;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive
            ? Theme.of(context).primaryColor
            : Colors.transparent,
        side: BorderSide(color: Theme.of(context).primaryColor),
        foregroundColor: isActive
            ? Colors.white
            : Theme.of(context).primaryColor,
      ),
      onPressed: () {
        widget.onThemeChanged(theme);
      },
      child: Text(label),
    );
  }

  Widget _buildCard({required String title, required Widget child}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(height: 20),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildTimeInputGroup({
    required String label,
    required TextEditingController hourController,
    required TextEditingController minuteController,
    required TextEditingController secondController,
    bool showLabel = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel && label.isNotEmpty)
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        if (showLabel) const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Jam', style: TextStyle(fontSize: 12)),
                  const SizedBox(height: 5),
                  TextField(
                    controller: hourController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: '00',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Menit', style: TextStyle(fontSize: 12)),
                  const SizedBox(height: 5),
                  TextField(
                    controller: minuteController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: '00',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Detik', style: TextStyle(fontSize: 12)),
                  const SizedBox(height: 5),
                  TextField(
                    controller: secondController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: '00',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNumberInputPair({
    required String label1,
    required TextEditingController controller1,
    required String label2,
    required TextEditingController controller2,
  }) {
    return Row(
      children: [
        Expanded(
          child: _buildLabeledInput(
            label: label1,
            controller: controller1,
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: _buildLabeledInput(
            label: label2,
            controller: controller2,
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }

  Widget _buildLabeledInput({
    required String label,
    required TextEditingController controller,
    required TextInputType keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: keyboardType == TextInputType.datetime
                ? 'YYYY-MM-DDTHH:MM'
                : 'Masukkan nilai',
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResultBox({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        border: Border(
          left: BorderSide(color: Theme.of(context).primaryColor, width: 4),
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }
}

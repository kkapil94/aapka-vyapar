import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Summary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const StockSummaryScreen(),
    );
  }
}

class StockSummaryScreen extends StatefulWidget {
  const StockSummaryScreen({Key? key}) : super(key: key);

  @override
  State<StockSummaryScreen> createState() => _StockSummaryScreenState();
}

class _StockSummaryScreenState extends State<StockSummaryScreen> {
  bool _showStockAsOnDate = false;
  String _selectedDate = "20/03/2025";

  // Sample data
  final List<Map<String, dynamic>> _stockItems = [
    {
      'name': 'Mohit',
      'category': 'GROCERY',
      'value': 100.00,
      'quantity': 50.00,
    },
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title:
            const Text('Stock Summary', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('Assets/Images/pdf.png', width: 24, height: 24),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('Assets/Images/xls.png', width: 24, height: 24),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const Divider(height: 1, color: Colors.grey),

          // Date checkbox
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Checkbox(
                  value: _showStockAsOnDate,
                  onChanged: (value) {
                    setState(() {
                      _showStockAsOnDate = value ?? false;
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const Text('Show stock as on Date :'),
                const SizedBox(width: 8),
                Text(_selectedDate, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),

          const Divider(height: 1, color: Colors.grey),

          // Filters section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Filters Applied :'),
                ElevatedButton.icon(
                  onPressed: () {
                    _showFiltersDialog();
                  },
                  icon: const Icon(Icons.filter_list, color: Colors.blue),
                  label: const Text('Filters',
                      style: TextStyle(color: Colors.blue)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.blue.shade200),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Filter chips
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _buildFilterChip('Item Category - All'),
                const SizedBox(width: 8),
                _buildFilterChip('Stock - All'),
                const SizedBox(width: 8),
                _buildFilterChip('Status - All'),
              ],
            ),
          ),

          // Stats cards
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: _buildStatsCard('No of Txns', '4', Colors.black),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildStatsCard('Low Stock Items', '5', Colors.red),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildStatsCard('Stock Value', '₹ 4750', Colors.black),
                ),
              ],
            ),
          ),

          // Stock item cards
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.lightBlue.shade100,
                    Colors.lightBlue.shade50,
                  ],
                ),
              ),
              child: ListView.builder(
                itemCount: _stockItems.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final item = _stockItems[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item['name'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(item['category']),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text('Stock Value : ',
                                  style: TextStyle(color: Colors.grey)),
                              Text('₹ ${item['value'].toStringAsFixed(2)}'),
                              const SizedBox(width: 16),
                              const Text('Stock Qty : ',
                                  style: TextStyle(color: Colors.grey)),
                              Text('${item['quantity'].toStringAsFixed(2)}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: const TextStyle(fontSize: 13)),
    );
  }

  Widget _buildStatsCard(String title, String value, Color valueColor) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: valueColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFiltersDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          child: FiltersDialog(
            onApply: () {
              Navigator.of(context).pop();
              // Apply filters logic here
            },
            onReset: () {
              Navigator.of(context).pop();
              // Reset filters logic here
            },
          ),
        );
      },
    );
  }
}

class FiltersDialog extends StatefulWidget {
  final VoidCallback onApply;
  final VoidCallback onReset;

  const FiltersDialog({
    Key? key,
    required this.onApply,
    required this.onReset,
  }) : super(key: key);

  @override
  State<FiltersDialog> createState() => _FiltersDialogState();
}

class _FiltersDialogState extends State<FiltersDialog> {
  String _selectedItemCategory = 'All';
  String _selectedStock = '';
  String _selectedStatus = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filters',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          const Divider(),

          // Filter options
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left column - Categories
                Container(
                  width: 150,
                  color: Colors.grey.shade200,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('By Item Category',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 30),
                      const Text('By Stock',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 30),
                      const Text('By Status',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),

                // Right column - Options
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildRadioOption('All', 'All', _selectedItemCategory,
                            (value) {
                          setState(() {
                            _selectedItemCategory = value!;
                          });
                        }),
                        const SizedBox(height: 16),
                        _buildRadioOption(
                            'Uncategorized', 'Uncategorized', _selectedStock,
                            (value) {
                          setState(() {
                            _selectedStock = value!;
                          });
                        }),
                        const SizedBox(height: 8),
                        _buildRadioOption('Grocery', 'Grocery', _selectedStock,
                            (value) {
                          setState(() {
                            _selectedStock = value!;
                          });
                        }),
                        const SizedBox(height: 8),
                        _buildRadioOption(
                            'Vegetable', 'Vegetable', _selectedStock, (value) {
                          setState(() {
                            _selectedStock = value!;
                          });
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: widget.onReset,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text('Reset'),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: widget.onApply,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text('Apply'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRadioOption(String label, String value, String groupValue,
      Function(String?) onChanged) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: Colors.deepPurple,
        ),
        Text(label),
      ],
    );
  }
}

import 'package:demo/Dashboard/Purchase_Report.dart';
import 'package:demo/Home/Party%20Details/Party_Statement.dart';
import 'package:demo/Home/Party%20Details/Show%20All/all_parties_report.dart';
import 'package:demo/Home/Sale_Report.dart';
import 'package:demo/Home/Transaction%20Details/Show%20All/all_transaction.dart';
import 'package:demo/Home/Transaction%20Details/Show%20All/day_book.dart';
import 'package:demo/Home/Transaction%20Details/Show%20All/profit&loss.dart';
import 'package:demo/Items/Stock%20Summary%20Report/Stock_summary_report.dart';
import 'package:demo/Menu/My%20business/Report/Bank_Statement.dart';
import 'package:demo/Menu/My%20business/Report/Cash_Flow.dart';
import 'package:demo/Menu/My%20business/Report/Discount_Report.dart';
import 'package:demo/Menu/My%20business/Report/Expense_Transaction.dart';
import 'package:demo/Menu/My%20business/Report/Item_Detail_Report.dart';
import 'package:demo/Menu/My%20business/Report/Item_Report_By_Party.dart';
import 'package:demo/Menu/My%20business/Report/Item_Wise_Discount.dart';
import 'package:demo/Menu/My%20business/Report/Item_Wise_Profit_And_Loss.dart';
import 'package:demo/Menu/My%20business/Report/Low_Stock_Summary.dart';
import 'package:demo/Menu/My%20business/Report/Party_Report_By_Item.dart';
import 'package:demo/Menu/My%20business/Report/Sale-Purchase_by_Party.dart';
import 'package:demo/Menu/My%20business/Report/Sale_Purchase_By_Item_Category.dart';
import 'package:demo/Menu/My%20business/Report/Stock_Detail_Report.dart';
import 'package:demo/Menu/My%20business/Report/Stock_Summary_By_Item_Category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFF0078AA),
          statusBarIconBrightness: Brightness.light,
        ),
        surfaceTintColor: Colors.blue.shade50,
        backgroundColor: Colors.blue.shade50,
        title:  Text('Reports'),
        leading: IconButton(
          icon:  Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle('Transaction'),
          _buildReportTile('Sale Report',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Sale_Report()));}),
          _buildReportTile('Purchase Report',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Purchase_Report()));}),
          _buildReportTile('Day Book',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Day_Book()));}),
          _buildReportTile('All Transaction',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>All_Transaction()));}),
          _buildReportTile('Profit & Loss',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Profit_and_loss()));}),
          _buildReportTile('Cashflow',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Cash_Flow()));}),

          _buildSectionTitle('Party Reports'),
          _buildReportTile('Party Statement',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Party_Statement()));}),
          _buildReportTile('All Parties Report',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>All_Parties_Report()));}),
          _buildReportTile('Parties Report by Items',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Party_Report_By_Item()));}),
          _buildReportTile('Sale/Purchase by Party',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Sale_Purchase_By_Party()));}),

          _buildSectionTitle('Item/Stock Reports'),
          _buildReportTile('Stock Summary Report',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Stock_Summary_Report()));}),
          _buildReportTile('Item Report by Party',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Item_Report_By_Party()));}),
          _buildReportTile('Item wise Profit & Loss',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Item_Wise_Profit_And_Loss()));}),
          _buildReportTile('Low Stock Summary Report',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Low_Stock_Summary()));}),
          _buildReportTile('Item Details Report',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Item_Detail_Report()));}),
          _buildReportTile('Stock Details Report',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Stock_Detail_Report()));}),
          _buildReportTile('Sale/Purchase By Item Caetgory',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Sale_Purchase_By_Item_Category()));}),
          _buildReportTile('Stock Summary By Item Category',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Stock_Summary_By_Item_Category()));}),
          _buildReportTile('Item Wise Discount',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Item_Wise_Discount()));}),

          _buildSectionTitle('Business staus'),
          _buildReportTile('Bank Statement',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Bank_Statement()));}),
          _buildReportTile('Discount Report',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Discount_Report()));}),

          _buildSectionTitle("Expenses reports"),
          _buildReportTile('Expenses Transaction Report',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Expense_Transaction()));}),
          _buildReportTile('Expense Category Report',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Discount_Report()));}),

        ],
      ),
    );
  }
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0078AA),
        ),
      ),
    );
  }

  Widget _buildReportTile(String title,VoidCallback callback) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      title: Text(title),
      onTap: callback,
    );
  }
}

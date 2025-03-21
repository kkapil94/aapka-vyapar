import 'package:flutter/material.dart';

import 'ItemDetails/itemDetails.dart';

Widget buildItemCard(BuildContext context, String itemName, double salePrice,
    double purchasePrice, double inStock, String category) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ItemDetailsScreen(
            itemName: itemName,
            salePrice: salePrice,
            purchasePrice: purchasePrice,
            inStock: inStock,
          ),
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                itemName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.share),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPriceColumn("Sale Price",
                  "₹ ${salePrice.toStringAsFixed(2)}", Colors.black),
              _buildPriceColumn("Purchase Price",
                  "₹ ${purchasePrice.toStringAsFixed(2)}", Colors.black),
              _buildPriceColumn(
                  "In Stock", inStock.toStringAsFixed(2), Colors.green),
            ],
          ),
        ],
      ),
    ),
  );
}

// Helper function for price columns
Widget _buildPriceColumn(String label, String price, Color priceColor) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 14,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        price,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: priceColor,
        ),
      ),
    ],
  );
}

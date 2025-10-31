import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/theme/app_text_styles.dart';

class DetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final String price;
  const DetailScreen({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double amount = 0;
  int quantity = 1;
  late double total;
  @override
  void initState() {
    amount = double.tryParse(widget.price) ?? 0;
    total = quantity * amount;
    super.initState();
  }

  void inceament() {
    setState(() {
      quantity++;
      total = quantity * amount;
    });
  }

  void decreament() {
    setState(() {
      quantity--;
      total = quantity * amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Custom AppBar with working back button
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffef2b39),
              borderRadius: BorderRadius.circular(30),
            ),
            margin: const EdgeInsets.only(left: 10, top: 10),
            child: const Icon(Icons.arrow_back, size: 30, color: Colors.white),
          ),
        ),
      ),

      // Scrollable content to handle overflow on smaller screens
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image centered and responsive
            Center(
              child: Image.asset(
                widget.image,
                // "assets/images/pizza.png",
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height / 3.5,
              ),
            ),
            const SizedBox(height: 16),

            // Product title
            Text(widget.name, style: AppTextStyles.headlineLarge),
            const SizedBox(height: 8),

            // Product price
            Text(widget.price, style: AppTextStyles.titleLarge),
            const SizedBox(height: 12),
            Text(
              "We’ve established that most cheeses will melt when baked atop pizza. "
              "But which will not only melt but stretch into those gooey, messy strands "
              "that make pizza eating such a delightfully challenging endeavor?",
              style: AppTextStyles.titleMedium,
            ),
            SizedBox(height: 20),
            Text("Quantity", style: AppTextStyles.titleLarge),
            SizedBox(height: 15),

            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    inceament();
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xffef2b39),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.add, size: 32, color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),

                Text(quantity.toString(), style: AppTextStyles.displaySmall),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    decreament();
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xffef2b39),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(Icons.remove, size: 32, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 70,
              width: 120,
              decoration: BoxDecoration(
                color: Color(0xffef2b39),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  total.toString(),
                  style: AppTextStyles.titleLarge.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

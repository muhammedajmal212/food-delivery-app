import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/theme/app_text_styles.dart';
import 'package:food_delivery_app/presentation/screens/detail_screen/widgets/add_icon.dart';
import 'package:food_delivery_app/presentation/screens/detail_screen/widgets/arrow_back_button.dart';
import 'package:food_delivery_app/presentation/screens/detail_screen/widgets/price_container.dart';
import 'package:food_delivery_app/presentation/screens/detail_screen/widgets/remove_icon.dart';
import 'package:food_delivery_app/presentation/screens/widgets/app_elevated_button.dart';

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
    if (quantity < 20) {
      setState(() {
        quantity++;
        total = quantity * amount;
      });
    }
  }

  void decreament() {
    if (quantity > 1) {
      setState(() {
        quantity--;
        total = quantity * amount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: ArrowBackButton(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                widget.image,
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height / 3.5,
              ),
            ),
            const SizedBox(height: 16),
            Text(widget.name, style: AppTextStyles.headlineLarge),
            const SizedBox(height: 8),
            Text('₹ ${widget.price}', style: AppTextStyles.titleLarge),
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
              children: [
                GestureDetector(
                  onTap: () {
                    decreament();
                  },
                  child: RemoveIcon(),
                ),
                SizedBox(width: 10),

                Text(quantity.toString(), style: AppTextStyles.displaySmall),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    inceament();
                  },
                  child: AddIcon(),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                PriceContainer(
                  label: Text(
                    "₹ ${total.toStringAsFixed(1)}",
                    style: AppTextStyles.titleLarge.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  height: 70,
                  width: 170,
                  color: Color(0xffef2b39),
                ),
                SizedBox(width: 20),
                AppElevatedButton(
                  label: Text(
                    "Order Now",
                    style: AppTextStyles.titleLarge.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  height: 70,
                  width: 180,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

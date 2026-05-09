import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:grocery1/features/payment/data/repositories/cart_repository.dart';
import 'package:grocery1/main_app.dart';

class Paymentscreen extends StatefulWidget {
  static const String routeName = "/payment";

  const Paymentscreen({super.key});

  @override
  State<Paymentscreen> createState() => _PaymentscreenState();
}

class _PaymentscreenState extends State<Paymentscreen> {
  CartRepositoryImpl repository = CartRepositoryImpl();

  bool isLoading = false;
  String? checkoutUrl;

  Map<String, dynamic>? args;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    _createSession(); // هنا آمن
  }

  Future<void> _createSession() async {
    final id = args?["id"];
    final amount = (args?["amount"] ?? 0).toDouble();

    setState(() => isLoading = true);

    final url = await repository.createCheckout({
      "order_id": id,
      "amount": amount,
    });

    setState(() {
      checkoutUrl = url;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (checkoutUrl == null) {
      return const Scaffold(
        body: Center(child: Text("No checkout url")),
      );
    }

    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(checkoutUrl!));

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Stripe Payment")),
      body: Column(
        children: [
          Expanded(child: WebViewWidget(controller: controller)),

          /// 🔥 fixed bottom button
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => MainApp()),
                      (route) => false,
                    );
                  },
                  child: const Text("Back to Home"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

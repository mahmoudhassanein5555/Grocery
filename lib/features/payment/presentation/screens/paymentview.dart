// import 'package:flutter/material.dart';
// import 'package:grocery1/features/cart/data/repositories/cart_repository.dart';
// import 'package:grocery1/main_app.dart';

// class Paymentscreen extends StatelessWidget {
//   static const String routeName = "/payment";
// CartRepositoryImpl repository = CartRepositoryImpl();
//   @override
//   Widget build(BuildContext context) {
//     final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

//     final id = args?["id"];
//     final amount = (args?["amount"] ?? 0).toDouble();

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         title: Text("Payment"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Text(
//               "Payment Screen for Order ID: $id amount: $amount",
//             ),



//           ),
//           ElevatedButton(
//           onPressed: () async {
//             await repository.createCheckout({
//               "order_id": id,
//               "amount": amount,
//             });
//           },
          
//           child: Text("Pay Now"),
//           ),
//          ElevatedButton(
//   onPressed: () {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (_) => MainApp()),
//     );
//   },
//   child: const Text("Back to Home"),
// ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:grocery1/features/cart/data/repositories/cart_repository.dart';
import 'package:grocery1/main_app.dart';

class Paymentscreen extends StatefulWidget {
  static const String routeName = "/payment";

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
        
        automaticallyImplyLeading: false  ,
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/features/cart/data/models/checkout_model.dart';
import 'package:grocery1/features/cart/domain/usecase/getcart_usecase.dart';
import 'package:grocery1/features/cart/presentation/screens/paymentview.dart';
import 'package:grocery1/features/delivery_addresses/data/repo/delivery_addresses_repo_impl.dart';
import 'package:grocery1/features/delivery_addresses/presentation/cubit/delivery_addresses_cubit.dart';
import 'package:grocery1/features/delivery_addresses/presentation/cubit/delivery_addresses_state.dart';

class Checkoutscreen extends StatefulWidget {
  static const String routeName = '/checkout';

  @override
  State<Checkoutscreen> createState() => _CheckoutscreenState();
}

class _CheckoutscreenState extends State<Checkoutscreen> {
  

  String? selectedAddressId;
  CreateOrderUseCase orderUseCase = CreateOrderUseCase();
  String? paymentMethod;
 //late  final cubit;
  String? deliveryType;
   void initState() {
    super.initState();
    context.read<DeliveryAddressesCubit>().getAddresses();
  }
  @override
  Widget build(BuildContext context) {
final args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

final items = args?["items"] as List<CheckoutItem> ?? [];
final total = args?["total"] ?? 0.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Checkout',
          style: TextStyle(
            color: ColorManager.primary,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<DeliveryAddressesCubit, DeliveryAddressesState>(
        builder: (context, state) {
          if (state is DeliveryAddressesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is DeliveryAddressesError) {
            return Center(child: Text(state.message));
          }

         
          if (state is DeliveryAddressesLoaded) {
            final addresses = state.addresses;


            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// ================= ADDRESS =================
                    _sectionTitle("Delivery Address"),

                    _card(
                      child: DropdownButton<String>(
                        value: selectedAddressId,
                        isExpanded: true,
                        underline: const SizedBox(),
                        hint: const Text("Select Address"),
                        items: addresses.map((address) {
                          return DropdownMenuItem<String>(
                            value: address.id.toString(),
                            child: Text(address.fullAddress),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedAddressId = value;
                          });
                        },
                      ),
                    ),

                    SizedBox(height: 20.h),

                    /// ================= ORDER SUMMARY =================
                    _sectionTitle("Order Summary"),

                    _card(
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: items.length,
                            itemBuilder: (_, i) {
                              final item = items[i];
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 6.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${item.name}'),
                                    Text("\$${item.total.toStringAsFixed(0)}"),
                                  ],
                                ),
                              );
                            },
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Total",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(
                                "\$${total.toStringAsFixed(0)}",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20.h),

                    /// ================= PAYMENT =================
                    _sectionTitle("Payment Method"),

                    _card(
                      child: DropdownButton<String>(
                        value: paymentMethod,
                        isExpanded: true,
                        underline: const SizedBox(),
                        hint: const Text("Select Payment"),
                        items: const [
                          DropdownMenuItem(value: "card", child: Text("Card")),
                          DropdownMenuItem(
                              value: "cash_on_delivery",
                              child: Text("Cash on Delivery")),
                        ],
                        onChanged: (value) {
                          setState(() {
                            paymentMethod = value;
                          });
                        },
                      ),
                    ),

                    SizedBox(height: 20.h),

                    /// ================= DELIVERY =================
                    _sectionTitle("Delivery Type"),

                    _card(
                      child: DropdownButton<String>(
                        value: deliveryType,
                        isExpanded: true,
                        underline: const SizedBox(),
                        hint: const Text("Select Delivery"),
                        items: const [
                          DropdownMenuItem(
                              value: "delivery", child: Text("Delivery")),
                          DropdownMenuItem(
                              value: "pickup", child: Text("Pickup")),
                        ],
                        onChanged: (value) {
                          setState(() {
                            deliveryType = value;
                          });
                        },
                      ),
                    ),

                    SizedBox(height: 30.h),

                    /// ================= BUTTON =================
                    SizedBox(
                      width: double.infinity,
                      height: 45.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        onPressed: () async {
                          if (selectedAddressId == null ||
                              paymentMethod == null ||
                              deliveryType == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(

                                backgroundColor: Colors.amber,
                                content: Text("Fill all fields ,please")),
                            );
                            return;
                          }

                          final orderData = {
                            "payment_method": paymentMethod,
                            "delivery_type": deliveryType,
                            "amount": total,
                            "payment_method_id":
                                paymentMethod == "card" ? '5' : '',
                            "address_id":deliveryType == 'delivery'? selectedAddressId : ''
                          };

                          final id = await orderUseCase.call(orderData);

                          ScaffoldMessenger.of(context).showSnackBar(

                        await  SnackBar(
                              backgroundColor: Colors.green,
                              content: Text("Order created successfully! ")),
                          );
                          Navigator.of(context).pushNamed(
                            
                            Paymentscreen.routeName
                            ,arguments: {
                            "id": id,
                            "amount": total,
                          });
                        },
                        child: Text("Place Order",
                            style: TextStyle(
                                fontSize: 16.sp, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      // width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      child: child,
    );
  }
}




// !

/** 
 payment_method : "card" or "cash_on_delivery"
 delivery_type : "delivery " or "pickup"
 amount : double  
 payment_method_id : int (optional, needed if payment_method is "card")
 address_id : int (optional, needed if delivery_type is "delivery")
 */
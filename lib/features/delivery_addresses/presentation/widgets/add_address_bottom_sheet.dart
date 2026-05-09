import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/customtxtfield.dart';
import '../../domain/entities/address_entity.dart';
import '../cubit/delivery_addresses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/address_entity.dart';
import '../cubit/delivery_addresses_cubit.dart';
import '../../../personal_details/presentation/widgets/country_code_widget.dart';

class AddAddressBottomSheet extends StatefulWidget {
  const AddAddressBottomSheet({super.key});

  @override
  State<AddAddressBottomSheet> createState() => _AddAddressBottomSheetState();
}

class _AddAddressBottomSheetState extends State<AddAddressBottomSheet> {
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  String _selectedCountryCode = '+20';

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  void _onSave() {
    context.read<DeliveryAddressesCubit>().storeAddress(
          AddressEntity(
            fullName: _fullNameController.text,
            phone: '$_selectedCountryCode${_phoneController.text}',
            streetAddress: _streetController.text,
            city: _cityController.text,
            country: 'Egypt',
          ),
        );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),

          const Text(
            'Add new address',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: 'inter',
              color: ColorManager.primary,
            ),
          ),
          const SizedBox(height: 16),

          // ── Full Name ─────────────────────────────
          CustomTextField(
            controller: _fullNameController,
            hintText: 'Full name',
            // hintColor: Colors.grey.shade400,!!!!!
            icon: Icons.person_outline,
            backgroundColor: Colors.white,
          ),
          const SizedBox(height: 12),

          // ── Country Code + Phone ──────────────────
          Row(
            children: [
              CountryCodeWidget(
                selectedCode: _selectedCountryCode,
                onChanged: (value) {
                  setState(() => _selectedCountryCode = value);
                },
              ),
              const SizedBox(width: 8),
              Expanded(
                child: CustomTextField(
                  controller: _phoneController,
                  hintText: 'Phone number',
                  // hintColor: Colors.grey.shade400,!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                  icon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ── Street ────────────────────────────────
          CustomTextField(
            controller: _streetController,
            hintText: 'Street address',
            icon: Icons.location_on_outlined,
            // hintColor: Colors.grey.shade400,!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            backgroundColor: Colors.white,
          ),
          const SizedBox(height: 12),

          // ── City ──────────────────────────────────
          CustomTextField(
            controller: _cityController,
            hintText: 'City',
            // hintColor: Colors.grey.shade400,!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            icon: Icons.location_city_outlined,
            backgroundColor: Colors.white,
          ),
          const SizedBox(height: 16),

          // ── Save Button ───────────────────────────
          SizedBox(
            width: double.infinity,
            height: 42,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: _onSave,
              child: const Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

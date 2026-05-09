import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../profile/presentation/widgets/divider_widget.dart';
import '../../data/repo/delivery_addresses_repo_impl.dart';
import '../cubit/delivery_addresses_cubit.dart';
import '../cubit/delivery_addresses_state.dart';
import '../widgets/add_address_bottom_sheet.dart';

class DeliveryAddressesView extends StatefulWidget {
  const DeliveryAddressesView({super.key});

  @override
  State<DeliveryAddressesView> createState() => _DeliveryAddressesViewState();
}

class _DeliveryAddressesViewState extends State<DeliveryAddressesView> {
  late DeliveryAddressesCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = DeliveryAddressesCubit(
      repo: DeliveryAddressesRepoImpl(apiManger: ApiManager()),
    )..getAddresses();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  void _showAddBottomSheet() {
    print('✅ opening bottom sheet');
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: ColorManager.appbarBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: const AddAddressBottomSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocConsumer<DeliveryAddressesCubit, DeliveryAddressesState>(
        listener: (context, state) {
          if (state is DeliveryAddressesError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          if (state is DeliveryAddressesStoreSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Address added successfully')),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorManager.appbarBackground,
            appBar: AppBar(
              backgroundColor: ColorManager.appbarBackground,
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back_ios, size: 19),
              ),
              title: Text('Delivery addresses',
                  style: TextStyle(fontSize: 18, fontFamily: 'inter')),
            ),
            body: state is DeliveryAddressesLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ))
                : state is DeliveryAddressesLoaded
                    ? state.addresses.isEmpty
                        ? const Center(
                            child: Text(
                            'No addresses yet',
                            style: TextStyle(
                                color: ColorManager.primary,
                                fontFamily: 'inter'),
                          ))
                        : ListView.separated(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 20),
                            itemCount: state.addresses.length,
                            separatorBuilder: (_, index) => DividerWidget(),
                            itemBuilder: (context, index) {
                              final address = state.addresses[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 7.0),
                                child: ListTile(
                                  leading: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.shade200,
                                    ),
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      color: ColorManager.primary,
                                    ),
                                  ),
                                  title: Text(
                                    address.fullAddress ?? '',
                                    style: TextStyle(
                                        color: ColorManager.primary,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'inter'),
                                  ),
                                  trailing: Icon(
                                    Icons.chevron_right,
                                    color: Colors.grey.shade300,
                                  ),
                                  onTap: () {},
                                ),
                              );
                            },
                          )
                    : const SizedBox(),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 42,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: _showAddBottomSheet,
                  child: const Text(
                    'Add new address',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

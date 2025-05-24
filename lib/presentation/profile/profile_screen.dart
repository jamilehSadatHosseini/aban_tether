import 'package:aban_tether_app/presentation/app_sizes.dart';
import 'package:aban_tether_app/presentation/profile/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../validators.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is PhoneUpdateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Phone number updated successfully!'),
              ),
            );
          } else if (state is PhoneUpdateError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.failure.message)));
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GetUserProfileSuccess) {
            final user = state.user;
            _phoneController.text = user.phoneNumber;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: user.name,
                      decoration: const InputDecoration(labelText: 'Name'),
                      enabled: false,
                    ),
                    const SizedBox(height: paddingMedium),
                    TextFormField(
                      initialValue: user.email,
                      decoration: const InputDecoration(labelText: 'Email'),
                      enabled: false,
                    ),
                    const SizedBox(height: paddingMedium),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                      ),
                      keyboardType: TextInputType.phone,
                      validator: Validators.validatePhoneNumber,
                    ),
                    const SizedBox(height: paddingLarge),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final updatedUser = user.copyWith(
                            phoneNumber: _phoneController.text,
                          );
                          context.read<ProfileBloc>().add(
                            UpdatePhoneEvent(updatedUser),
                          );
                        }
                      },
                      child: const Text('Update Phone Number'),
                    ),
                  ],
                ),
              ),
            );
          }

          return const Center(child: Text('No profile data.'));
        },
      ),
    );
  }
}

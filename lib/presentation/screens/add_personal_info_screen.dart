import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_swap/business_logic/cubit/add_personal_info_stepper_cubit.dart';

class AddPersonalInfoScreen extends StatelessWidget {
  const AddPersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPersonalInfoStepperCubit(),
      child: _AddPersonalInfoScreenBody(),
    );
  }
}

class _AddPersonalInfoScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: SafeArea(
          child: BlocBuilder<AddPersonalInfoStepperCubit, int>(
            builder: (context, currentStep) {
              return Stepper(
                type: StepperType.horizontal,
                currentStep: currentStep,
                onStepContinue: () =>
                    context.read<AddPersonalInfoStepperCubit>().nextStep(),
                onStepCancel: () =>
                    context.read<AddPersonalInfoStepperCubit>().previousStep(),
                steps: const <Step>[
                  Step(
                    title: Text('Step 1'),
                    content: TextField(
                      decoration: InputDecoration(labelText: 'Enter your name'),
                    ),
                  ),
                  Step(
                    title: Text('Step 2'),
                    content: TextField(
                      decoration:
                          InputDecoration(labelText: 'Enter your email'),
                    ),
                  ),
                  Step(
                    title: Text('Step 3'),
                    content: TextField(
                      decoration:
                          InputDecoration(labelText: 'Enter your phone number'),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

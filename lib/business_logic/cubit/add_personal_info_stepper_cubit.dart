import 'package:hydrated_bloc/hydrated_bloc.dart';

class AddPersonalInfoStepperCubit extends HydratedCubit<int> {
  AddPersonalInfoStepperCubit() : super(0);

  void nextStep() {
    if (state < 2) emit(state + 1);
  }

  void previousStep() {
    if (state > 0) emit(state - 1);
  }

  @override
  int? fromJson(Map<String, dynamic> json) {
    return json['stepIndex'] as int?;
  }

  @override
  Map<String, dynamic>? toJson(int state) {
    return <String, int>{'stepIndex': state};
  }
}

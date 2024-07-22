// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../controller/i18n_cubit.dart';
// import '../presentation/i18n_loading_page.dart';
// import 'bloc_container.dart';
//
// typedef Widget I18NMessagesCreator(I18NMessages messages);
//
// class I18NLoadingContainer extends BlocContainer {
//   final I18NMessagesCreator _creator;
//
//   const I18NLoadingContainer(this._creator, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<I18NMessagesCubit>(
//       create: (context) {
//         final cubit = I18NMessagesCubit();
//         cubit.loadMessages();
//         return cubit;
//       },
//       child: I18NLoadingPage(creator: _creator),
//     );
//   }
// }

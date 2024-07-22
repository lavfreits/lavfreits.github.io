// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class I18NMessagesCubit extends Cubit<I18NMessagesState> {
//   I18NMessagesCubit() : super(I18NMessagesLoading());
//
//   void loadMessages() {
//     emit(
//       I18NMessagesLoaded(
//         I18NMessages(),
//       ),
//     );
//   }
// }
//
// abstract class I18NMessagesState {}
//
// class I18NMessagesLoaded extends I18NMessagesState {
//   final I18NMessages messages;
//
//   I18NMessagesLoaded(this.messages);
// }
//
// class I18NMessages {
//   final Map<String, String> _messages;
//
//   I18NMessages(this._messages);
//
//   String get(String key) {
//     assert(_messages.containsKey(key), 'Key $key not found');
//     assert(_messages[key] != null, 'Key $key not found');
//
//     return _messages[key]!;
//   }
// }
//
// class I18NMessagesLoading extends I18NMessagesState {}
//
// class I18NMessagesError extends I18NMessagesState {}

import 'package:equatable/equatable.dart';

class PageViewEntity extends Equatable {
  final num number;
  final String text;
  final List<String> list;

  const PageViewEntity({
    required this.number,
    required this.text,
    required this.list,
  });

  PageViewEntity copyWith({
    num? number,
    String? text,
    List<String>? list,
  }) {
    return PageViewEntity(
      number: number ?? this.number,
      text: text ?? this.text,
      list: list ?? this.list,
    );
  }

  @override
  List<Object?> get props => [
        number,
        text,
        list,
      ];
}

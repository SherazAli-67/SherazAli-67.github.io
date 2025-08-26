import 'package:flutter/material.dart';

class ExperienceModel {
  final String id;
  final String title;
  final List<TextSpan> keyResponsibilities;
  final String duration;
  final String companyIcon;

  ExperienceModel({
    required this.id,
    required this.title,
    required this.duration,
    required this.keyResponsibilities,
    required this.companyIcon,
  });

  /// Convert TextSpan list into List<Map>
  List<Map<String, dynamic>> _textSpansToMap(List<TextSpan> spans) {
    return spans.map((span) {
      return {
        'text': span.text ?? '',
        'fontFamily': span.style?.fontFamily,
        'fontWeight': span.style?.fontWeight?.toString(),
        'color': span.style?.color?.value,
      };
    }).toList();
  }

  /// Convert List<Map> into TextSpan list
  List<TextSpan> _mapToTextSpans(List<dynamic> data, Color defaultColor) {
    return data.map((item) {
      return TextSpan(
        text: item['text'] ?? '',
        style: TextStyle(
          fontFamily: item['fontFamily'],
          fontWeight: _parseFontWeight(item['fontWeight']),
          color: item['color'] != null ? Color(item['color']) : defaultColor,
        ),
      );
    }).toList();
  }

  /// Helper: parse string back into FontWeight
  FontWeight? _parseFontWeight(String? weight) {
    if (weight == null) return null;
    switch (weight) {
      case 'FontWeight.w600':
        return FontWeight.w600;
      case 'FontWeight.bold':
        return FontWeight.bold;
      default:
        return FontWeight.normal;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'duration': duration,
      'companyIcon': companyIcon,
      'keyResponsibilities': keyResponsibilities.expand((span) {
        // If span has children, flatten them into the same list
        if (span.children != null && span.children!.isNotEmpty) {
          return span.children!.map((child) => {
            'text': child.toPlainText() ?? '',
            'fontFamily': child.style?.fontFamily,
            'fontWeight': child.style?.fontWeight?.toString(),
            'color': child.style?.color?.value,
          });
        } else {
          return [
            {
              'text': span.text ?? '',
              'fontFamily': span.style?.fontFamily,
              'fontWeight': span.style?.fontWeight?.toString(),
              'color': span.style?.color?.value,
            }
          ];
        }
      }).toList(),
    };
  }

  factory ExperienceModel.fromMap(Map<String, dynamic> map, {Color defaultColor = Colors.black}) {
    return ExperienceModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      duration: map['duration'] ?? '',
      companyIcon: map['companyIcon'] ?? '',
      keyResponsibilities: (map['keyResponsibilities'] as List<dynamic>? ?? []).map((item) {
        return TextSpan(
          text: item['text'] ?? '',
          style: TextStyle(
            fontFamily: item['fontFamily'],
            fontWeight: FontWeight.values.firstWhere(
                    (fw) => fw.toString() == (item['fontWeight'] ?? 'FontWeight.normal'),
                orElse: () => FontWeight.normal),
            color: item['color'] != null ? Color(item['color']) : defaultColor,
          ),
        );
      }).toList(),
    );
  }
}
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore: camel_case_types
class CompanyModel {
  final String companyName;
  final String companyHR;
  final String companyID;
  final String HRNumber;
  final String companyCity;

  CompanyModel({
    required this.companyName,
    required this.companyHR,
    required this.companyID,
    required this.HRNumber,
    required this.companyCity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'companyName': companyName,
      'companyHR': companyHR,
      'companyID': companyID,
      'HRNumber': HRNumber,
      'companyCity': companyCity,
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      companyName: map['companyName'] as String,
      companyHR: map['companyHR'] as String,
      companyID: map['companyID'] as String,
      HRNumber: map['HRNumber'] as String,
      companyCity: map['companyCity'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) => CompanyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

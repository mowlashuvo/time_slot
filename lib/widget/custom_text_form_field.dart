import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.hintText,
    this.editingController,
    this.onChanged,
  }) : super(key: key);

  final String title;
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? editingController;

  @override
  Widget build(BuildContext context) {
    var keyboardType = TextInputType.number;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 0.0.w),
      width: 100.w,
      child: TextFormField(
        //key: _formKey,
        keyboardType: keyboardType,
        onChanged: onChanged,
        controller: editingController,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 10.0.w),
          isDense: true,
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(223, 223, 223, 1)),
            borderRadius: BorderRadius.all(
              Radius.circular(6.0.r),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(223, 223, 223, 1)),
            borderRadius: BorderRadius.all(
              Radius.circular(6.0.r),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(223, 223, 223, 1)),
            borderRadius: BorderRadius.all(
              Radius.circular(6.0.r),
            ),
          ),
          focusColor: Colors.white,
          fillColor: Colors.white,
          filled: false,
          hoverColor: Colors.white,
          hintText: hintText,
          // suffixIcon: suffix,
          hintStyle: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}

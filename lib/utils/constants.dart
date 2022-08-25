import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:flutter/material.dart';

showCustomSnackBar(BuildContext context) => showTopSnackBar(
    context,
    const CustomSnackBar.error(
      backgroundColor: Color.fromARGB(255, 115, 44, 191),
        message:
            "Somthing went wrong!, please check your internet connection!"));

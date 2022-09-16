// import 'package:flutter/material.dart';

// import '../../service/authenticate.dart';
// import '../../widgets/app_text.dart';
// import '../../widgets/constrant.dart';

// class SignInPage extends StatefulWidget {
//   const SignInPage({Key? key}) : super(key: key);

//   @override
//   State<SignInPage> createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   // final TextEditingController _emailController = TextEditingController();
//   // final TextEditingController _passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     final maxW = MediaQuery.of(context).size.width;
//     final maxH = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Container(color: Colors.red,)
//           /// email input
//           // SizedBox(
//           //   width: maxW - 70,
//           //   height: 55,
//           //   child: TextFormField(
//           //     controller: _emailController,
//           //     obscureText: true,
//           //     style: const TextStyle(
//           //       fontSize: 17,
//           //       color: Constrant.textBlack,
//           //     ),
//           //     decoration: InputDecoration(
//           //       labelText: "Email",
//           //       labelStyle: const TextStyle(
//           //         fontSize: 17,
//           //         color: Constrant.textBlack,
//           //       ),
//           //       focusedBorder: OutlineInputBorder(
//           //         borderRadius: BorderRadius.circular(15),
//           //         borderSide: const BorderSide(
//           //           width: 1.5,
//           //           color: Colors.amber,
//           //         ),
//           //       ),
//           //       enabledBorder: OutlineInputBorder(
//           //         borderRadius: BorderRadius.circular(15),
//           //         borderSide: const BorderSide(
//           //           width: 1,
//           //           color: Colors.grey,
//           //         ),
//           //       ),
//           //     ),
//           //   ),
//           // ),
//           // const SizedBox(
//           //   height: 20,
//           // ),

//           // /// password input
//           // SizedBox(
//           //   width: MediaQuery.of(context).size.width - 70,
//           //   height: 55,
//           //   child: TextFormField(
//           //     controller: _passwordController,
//           //     obscureText: true,
//           //     style: const TextStyle(
//           //       fontSize: 17,
//           //       color: Constrant.textBlack,
//           //     ),
//           //     decoration: InputDecoration(
//           //       labelText: "Password",
//           //       labelStyle: const TextStyle(
//           //         fontSize: 17,
//           //         color: Constrant.textBlack,
//           //       ),
//           //       focusedBorder: OutlineInputBorder(
//           //         borderRadius: BorderRadius.circular(15),
//           //         borderSide: const BorderSide(
//           //           width: 1.5,
//           //           color: Colors.amber,
//           //         ),
//           //       ),
//           //       enabledBorder: OutlineInputBorder(
//           //         borderRadius: BorderRadius.circular(15),
//           //         borderSide: const BorderSide(
//           //           width: 1,
//           //           color: Colors.grey,
//           //         ),
//           //       ),
//           //     ),
//           //   ),
//           // ),
//           // const SizedBox(
//           //   height: 15,
//           // ),
//           // Padding(
//           //   padding: const EdgeInsets.only(left: 40, right: 40),
//           //   child: Container(
//           //     color: Constrant.p6,
//           //     child: TextButton(
//           //       onPressed: () {},
//           //       child: Row(
//           //         mainAxisAlignment: MainAxisAlignment.center,
//           //         children: const [
//           //           AppText(
//           //             text: "Sign In",
//           //             color: Constrant.textWhite,
//           //           ),
//           //           SizedBox(
//           //             width: 10,
//           //           ),
//           //           Icon(Icons.login, color: Constrant.textWhite)
//           //         ],
//           //       ),
//           //     ),
//           //   ),
//           // ),
//           // const SizedBox(
//           //   height: 10,
//           // ),
//           // AppText(
//           //   text: "OR",
//           //   size: 20,
//           //   color: Constrant.textBlack.withOpacity(0.7),
//           // ),
//           // const SizedBox(
//           //   height: 10,
//           // ),
//           Center(
//             child: Image.asset(
//               "assets/iHun.png",
//               height: 150,
//               width: 200,
//             ),
//           ),

//           ///sign in with google
//           Padding(
//             padding: const EdgeInsets.only(left: 40, right: 40),
//             child: Container(
//               color: Constrant.p3.withOpacity(0.7),
//               child: TextButton(
//                 onPressed: () {
//                   Authentication().signInWithGoogle();
//                 },
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const AppText(
//                       text: "Sign in with Google",
//                       color: Constrant.textWhite,
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Image.asset(
//                       "assets/google-icon.png",
//                       width: maxW - (maxW - 25),
//                       height: maxH - (maxH - 25),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),

//           ///sign in with facebook
//           Padding(
//             padding: const EdgeInsets.only(left: 40, right: 40),
//             child: Container(
//               color: Constrant.p2,
//               child: TextButton(
//                 onPressed: () {
//                   // Authentication().signInWithFacebook();
//                 },
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     AppText(
//                       text: "Sign in with Facebook",
//                       color: Constrant.textWhite,
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Icon(
//                       Icons.facebook,
//                       color: Colors.white,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

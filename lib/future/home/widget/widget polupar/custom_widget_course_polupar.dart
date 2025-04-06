import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/home/cubit/home_cubit.dart';
import 'package:education/future/home/data/model/response_home/course.dart';
import 'package:education/future/home/widget/icons_save.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../utility/images_aseets.dart';

// class FilterCoursesBlocBuilder extends StatelessWidget {
//   const FilterCoursesBlocBuilder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeCubit, HomeState>(
//       buildWhen: (previous, current) =>
//           current is FilterCourseState || current is FailtercourseLoadedState,
//       builder: (context, state) {
//         if (state is FailtercourseLoadedState) {
//           return Skeletonizer(
//             child: CustomWidgetPoluparCourse(
//               courses: List.generate(
//                   3, (index) => Course()), // إنشاء 3 كورسات افتراضية
//             ),
//           );
//         } else if (state is FilterCourseState) {
//           return CustomWidgetPoluparCourse(
//             courses: state.courses,
//           );
//         }
//         return const SizedBox.shrink();
//       },
//     );
//   }
// }

// class CustomWidgetPoluparCourse extends StatelessWidget {
//   final List<Course> courses;

//   const CustomWidgetPoluparCourse({super.key, required this.courses});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height,
//       child: ListView.builder(
//         physics: const BouncingScrollPhysics(),
//         padding: const EdgeInsets.all(16),
//         itemCount: courses.length,
//         itemBuilder: (context, index) {
//           final course = courses[index];
//           return _buildCourseItem(context, course);
//         },
//       ),
//     );
//   }

//   Widget _buildCourseItem(BuildContext context, Course course) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           // الصورة العلوية
//           Container(
//             height: 120,
//             decoration: const BoxDecoration(
//               color: Colors.black,
//               borderRadius: BorderRadius.vertical(
//                 top: Radius.circular(20),
//               ),
//             ),
//           ),

//           // محتوى الكارت
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // الصف العلوي (التصنيف + زر الحفظ)
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       course.categoryName?.isNotEmpty ?? false
//                           ? context.translate(course.categoryName!)
//                           : 'No Category',
//                       style: Theme.of(context).textTheme.labelMedium?.copyWith(
//                             color: Colors.orange,
//                             fontWeight: FontWeight.bold,
//                           ),
//                     ),
//                     SaveIcons(courseId: course.id?.toString() ?? '0'),
//                   ],
//                 ),

//                 const SizedBox(height: 8),

//                 // عنوان الكورس
//                 Text(
//                   course.title ?? 'No Title',
//                   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                       ),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),

//                 const SizedBox(height: 12),

//                 // السعر
//                 Text(
//                   course.paid == true
//                       ? '\$${course.price?.toStringAsFixed(2) ?? '0.00'}'
//                       : 'Free',
//                   style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                       ),
//                 ),

//                 const SizedBox(height: 12),

//                 // التقييم وعدد الطلاب
//                 Row(
//                   children: [
//                     const Icon(Icons.star, color: Colors.amber, size: 20),
//                     const SizedBox(width: 4),
//                     Text(
//                       '4.2',
//                       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                             fontWeight: FontWeight.bold,
//                           ),
//                     ),
//                     const SizedBox(width: 12),
//                     const Text('|'),
//                     const SizedBox(width: 12),
//                     const Icon(Icons.people_alt_outlined, size: 20),
//                     const SizedBox(width: 4),
//                     Text(
//                       '7830',
//                       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                             fontWeight: FontWeight.bold,
//                           ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class FilterCoursesBlocBuilder extends StatelessWidget {
  const FilterCoursesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is FilterCourseState || current is FailtercourseLoadedState,
        builder: (context, state) {
          if (state is FailtercourseLoadedState) {
            return Skeletonizer(
                child: CustomWidgetPoluparCourse(
                    course: List.generate(3, (index) => Course())));
          } else if (state is FilterCourseState) {
            return CustomWidgetPoluparCourse(
              course: state.courses,
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}

class CustomWidgetPoluparCourse extends StatelessWidget {
  const CustomWidgetPoluparCourse({super.key, required this.course});
  final List<Course> course;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context),
      height: height(context),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(8),
        itemCount: course.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: height(context) / 5, // تحديد ارتفاع ثابت لكل عنصر
              child: Row(
                children: [
                  Expanded(
                    flex: 2, // جزء الصورة يأخذ 40% من المساحة
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3, // جزء المحتوى يأخذ 60% من المساحة
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.horizontal(right: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x14000000),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // الصف العلوي (التصنيف + زر الحفظ)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    context.translate(
                                        course[i].categoryName ?? ''),
                                    style:
                                        context.textStyle.labelMedium!.copyWith(
                                      color: context.color.orangeBright,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SaveIcons(courseId: course[i].id.toString()),
                              ],
                            ),

                            // عنوان الكورس
                            Text(
                              course[i].title ?? 'title',
                              style: context.textStyle.headlineSmall!.copyWith(
                                color: context.color.primaryColor,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),

                            // السعر
                            Text(
                              course[i].paid ?? false
                                  ? "\$${course[i].price ?? ''}"
                                  : "Free",
                              style: context.textStyle.titleMedium!.copyWith(
                                color: context.color.blue,
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                            // التقييم وعدد الطلاب
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(Assets.imagesStar),
                                const SizedBox(width: 4),
                                Text(
                                  '4.2',
                                  style:
                                      context.textStyle.displayLarge!.copyWith(
                                    color: context.color.primaryColor,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  '|',
                                  style: context.textStyle.titleLarge!.copyWith(
                                    color: context.color.black,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  '7830 Std',
                                  style:
                                      context.textStyle.displayLarge!.copyWith(
                                    color: context.color.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// class CustomWidgetPoluparCourse extends StatelessWidget {
//   const CustomWidgetPoluparCourse({super.key, required this.course});
//   final List<Course> course;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width(context),
//       height: height(context),
//       child: ListView.builder(
//           physics: const BouncingScrollPhysics(),
//           padding: const EdgeInsets.all(16),
//           itemCount: course.length,
//           itemBuilder: (context, i) {
//             return Row(
//               children: [
//                 Container(
//                   decoration: const ShapeDecoration(
//                     color: Colors.black,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(20),
//                         topRight: Radius.circular(20),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   decoration: const ShapeDecoration(
//                     color: Colors.white,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(20),
//                       bottomRight: Radius.circular(20),
//                     )),
//                     shadows: [
//                       BoxShadow(
//                         color: Color(0x14000000),
//                         blurRadius: 10,
//                         offset: Offset(0, 4),
//                         spreadRadius: 0,
//                       )
//                     ],
//                   ),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 11, vertical: 11),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             // const Spacer(),
//                             Text(
//                                 context.translate(course[i].categoryName ?? ''),
//                                 style: context.textStyle.labelMedium!.copyWith(
//                                   color: context.color.orangeBright,
//                                   fontWeight: FontWeight.w700,
//                                 )),
//                             const Spacer(),
//                             SaveIcons(courseId: course[i].id.toString())

//                             // const Spacer(),
//                           ],
//                         ),
//                       ),
//                       const Spacer(),
//                       Align(
//                         // alignment: Alignment.centerLeft,
//                         child: Text(course[i].title ?? 'title',
//                             overflow: TextOverflow.ellipsis,
//                             style: context.textStyle.headlineSmall!.copyWith(
//                               color: context.color.primaryColor,
//                             )),
//                       ),
//                       const Spacer(),
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 0, horizontal: 11),
//                           child: course[i].paid ?? false
//                               ? Text("\$${course[i].price ?? ''}",
//                                   style:
//                                       context.textStyle.titleMedium!.copyWith(
//                                     color: context.color.blue,
//                                     fontWeight: FontWeight.w800,
//                                   ))
//                               : Text("Free",
//                                   style:
//                                       context.textStyle.titleMedium!.copyWith(
//                                     color: context.color.blue,
//                                     fontWeight: FontWeight.w800,
//                                   )),
//                         ),
//                       ),
//                       const Spacer(),
//                       Row(
//                         children: [
//                           const Spacer(
//                             flex: 2,
//                           ),
//                           SvgPicture.asset(
//                             Assets.imagesStar,
//                           ),
//                           Text('4.2',
//                               style: context.textStyle.displayLarge!
//                                   .copyWith(color: context.color.primaryColor)),
//                           const Spacer(
//                             flex: 1,
//                           ),
//                           Text('|',
//                               style: context.textStyle.titleLarge!
//                                   .copyWith(color: context.color.black)),
//                           const Spacer(
//                             flex: 1,
//                           ),
//                           Text('7830 Std',
//                               style: context.textStyle.displayLarge!
//                                   .copyWith(color: context.color.primaryColor)),
//                           const Spacer(
//                             flex: 2,
//                           ),
//                         ],
//                       ),
//                       const Spacer()
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           }),
//     );
//   }
// }

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../utils/app_constants/app_images.dart';

class Service {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final List<SubService> subServices;

  Service({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.subServices,
  });
}

class SubService {
  final String name;
  final String description;
  final IconData icon;
  final bool isPremium;
  final double? price;

  SubService({
    required this.name,
    required this.description,
    required this.icon,
    this.isPremium = false,
    this.price,
  });
}

class Beauty{
  String id;
  String title;
  String? description;
  String? image;
  IconData? icon;
  Color? color;
  List<SubBeauty> subBeauty;
  Beauty({required this.id,required this.title,this.description,this.image,this.icon,this.color,required this.subBeauty});
}

class SubBeauty{
  String id;
  String name;
  String? description;
  String? image;
  double? price;
  SubBeauty({required this.id,required this.name,this.description,this.image,this.price});
}


class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();

}

class _ServicesScreenState extends State<ServicesScreen> {
  final List<String> categories = ['All','Weddings & Receptions', "Anniversary Celebrations", "Baby Showers", "Family Reunions", 'Birthday Event', 'Resorts Booking', 'Marriage Hall', "Party Booking","Engagement Parties", 'Music', 'Sports', 'Arts', 'Food'];
  final List<Beauty> beautyList = [
    Beauty(
        id: "1",
        title: "Skincare",
        subBeauty: [
          SubBeauty(id: "1", name: "Cleansers"),
          SubBeauty(id: "2", name: "Moisturizers"),
          SubBeauty(id: "3", name: "Serums & Essences"),
          SubBeauty(id: "4", name: "Sunscreen & Sun Protection"),
          SubBeauty(id: "5", name: "Exfoliators (Physical/Chemical)"),
          SubBeauty(id: "6", name: "Face Masks (Sheet, Clay, Gel)"),
          SubBeauty(id: "7", name: "Toners & Mists"),
          SubBeauty(id: "8", name: "Eye Creams & Treatments"),
          SubBeauty(id: "9", name: "Acne Treatments"),
          SubBeauty(id: "10", name: "Anti-Aging & Wrinkle Creams"),
          SubBeauty(id: "11", name: "Lip Balms & Treatments"),
        ]
    ),
    Beauty(
        id: "2",
        title: "Makeup",
        subBeauty: [
          SubBeauty(id: "1", name: "Foundation & Concealer"),
          SubBeauty(id: "2", name: "Powder (Setting, Translucent)"),
          SubBeauty(id: "3", name: "Blush, Bronzer & Highlighter"),
          SubBeauty(id: "4", name: "Eyeshadow, Eyeliner & Mascara"),
          SubBeauty(id: "5", name: "Lipstick, Lip Gloss & Lip Liner"),
          SubBeauty(id: "6", name: "Primer & Setting Spray"),
          SubBeauty(id: "7", name: "Makeup Tools (Brushes, Sponges, Eyelash Curlers)"),
        ]
    ),
    Beauty(
        id: "3",
        title: "Haircare",
        subBeauty: [
          SubBeauty(id: "1", name: "Shampoo & Conditioner"),
          SubBeauty(id: "2", name: "Hair Masks & Treatments"),
          SubBeauty(id: "3", name: "Styling Products (Gel, Mousse, Hairspray)"),
          SubBeauty(id: "4", name: "Heat Protectants"),
          SubBeauty(id: "5", name: "Hair Color & Dyes"),
          SubBeauty(id: "6", name: "Extensions & Wigs"),
          SubBeauty(id: "7", name: "Accessories (Clips, Headbands, Scrunchies)"),
        ]
    ),
    Beauty(
        id: "4",
        title: "Fragrances",
        subBeauty: [
          SubBeauty(id: "1", name: "Perfume & Cologne"),
          SubBeauty(id: "2", name: "Body Sprays & Mists"),
          SubBeauty(id: "3", name: "Scented Lotions & Oils"),
          SubBeauty(id: "4", name: "Essential Oils"),
        ]
    ),
    Beauty(
        id: "5",
        title: "Body Care",
        subBeauty: [
          SubBeauty(id: "1", name: "Body Wash & Scrubs"),
          SubBeauty(id: "2", name: "Body Lotion & Oil"),
          SubBeauty(id: "3", name: "Deodorant & Antiperspirant"),
          SubBeauty(id: "4", name: "Hand & Foot Creams"),
          SubBeauty(id: "5", name: "Self-Tanning Products"),
        ]
    ),
    Beauty(
        id: "6",
        title: "Nail Care",
        subBeauty: [
          SubBeauty(id: "1", name: "Nail Polish (Regular, Gel)"),
          SubBeauty(id: "2", name: "Base & Top Coats"),
          SubBeauty(id: "3", name: "Cuticle Oils & Treatments"),
          SubBeauty(id: "4", name: "Nail Art Supplies"),
          SubBeauty(id: "5", name: "Artificial Nails & Tips"),
        ]
    ),
    Beauty(
        id: "7",
        title: "Men’s Grooming",
        subBeauty: [
          SubBeauty(id: "1", name: "Shaving Products (Razors, Creams)"),
          SubBeauty(id: "2", name: "Beard Oils & Balms"),
          SubBeauty(id: "3", name: "Aftershave & Skincare for Men"),
          SubBeauty(id: "4", name: "Hair Styling Products"),
        ]
    ),
    Beauty(
        id: "8",
        title: "Natural & Organic Beauty",
        subBeauty: [
          SubBeauty(id: "1", name: "Clean Beauty (Non-Toxic Ingredients)"),
          SubBeauty(id: "2", name: "Vegan & Cruelty-Free Products"),
          SubBeauty(id: "3", name: "Sustainable/Eco-Friendly Packaging"),
        ]
    ),
    Beauty(
        id: "9",
        title: "Tools & Accessories",
        subBeauty: [
          SubBeauty(id: "1", name: "Makeup Brushes & Sponges"),
          SubBeauty(id: "2", name: "Hair Tools (Dryers, Straighteners)"),
          SubBeauty(id: "3", name: "Skincare Devices (Rollers, Gua Sha)"),
        ]
    ),
    Beauty(
        id: "10",
        title: "Medical & Professional Treatments",
        subBeauty: [
          SubBeauty(id: "1", name: "Cosmetic Dermatology (Botox, Fillers)"),
          SubBeauty(id: "2", name: "Chemical Peels & Microdermabrasion"),
          SubBeauty(id: "3", name: "Laser Treatments & Permanent Makeup"),
        ]
    ),
    Beauty(
        id: "11",
        title: "Hair Removal",
        subBeauty: [
          SubBeauty(id: "1", name: "Razors & Shaving Creams"),
          SubBeauty(id: "2", name: "Waxing Kits & Depilatory Creams"),
          SubBeauty(id: "3", name: "Epilators & Laser Devices"),
        ]
    ),
    Beauty(
        id: "12",
        title: "Oral Care",
        subBeauty: [
          SubBeauty(id: "1", name: "Toothpaste & Mouthwash"),
          SubBeauty(id: "2", name: "Teeth Whitening Products"),
          SubBeauty(id: "3", name: "Dental Floss & Tongue Cleaners"),
        ]
    ),
    Beauty(
        id: "13",
        title: "Specialty Beauty",
        subBeauty: [
          SubBeauty(id: "1", name: "Maternity Products (Stretch Mark Creams)"),
          SubBeauty(id: "2", name: "Sensitive Skin Solutions"),
          SubBeauty(id: "3", name: "Travel-Sized Products"),
        ]
    ),
    Beauty(
        id: "14",
        title: "Wellness & Holistic Beauty",
        subBeauty: [
          SubBeauty(id: "1", name: "Beauty Supplements (Collagen, Vitamins)"),
          SubBeauty(id: "2", name: "Aromatherapy & CBD Products"),
          SubBeauty(id: "3", name: "Detox & Cleanse Kits"),
        ]
    ),
    Beauty(
        id: "15",
        title: "Bath & Shower",
        subBeauty: [
          SubBeauty(id: "1", name: "Bath Salts & Bubble Bath"),
          SubBeauty(id: "2", name: "Shower Gels & Oils"),
          SubBeauty(id: "3", name: "Exfoliating Gloves & Loofahs"),
        ]
    ),
    Beauty(
        id: "16",
        title: "Seasonal & Trends",
        subBeauty: [
          SubBeauty(id: "1", name: "Holiday Kits & Limited Editions"),
          SubBeauty(id: "2", name: "Trend-Driven Products (e.g., Glitter, Neon)"),
        ]
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppImages.loading,width: 50,height: 50),
            DefaultTextStyle(
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText("Ezy Booking")
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    print("Top Event");
                  },
                )
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Events
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.99,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Events",style: TextStyle(color: Colors.white)),
                      Text("See All",style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: GridView.builder(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: categories.length >= 12 ? 12 : categories.length,
                  itemBuilder: (context, index) {
                    var cat = categories[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[900]
                      ),
                      child: Center(child: Text(cat,style: TextStyle(color: Colors.white),textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis,)),
                    );
                  },
              ),
            ),
            SizedBox(height: 30,),

            /// Beauty
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.99,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Beauty",style: TextStyle(color: Colors.white)),
                      Text("See All",style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: beautyList.length >= 12 ? 12 : beautyList.length,
                itemBuilder: (context, index) {
                  var beauty = beautyList[index];
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[900]
                    ),
                    child: Center(child: Text(beauty.title,style: TextStyle(color: Colors.white),textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis,)),
                  );
                },
              ),
            ),
            SizedBox(height: 30,),

            ///
            // Padding(
            //   padding: const EdgeInsets.only(left: 16,right: 16),
            //   child: Container(
            //     width: MediaQuery.sizeOf(context).width * 0.99,
            //     height: 30,
            //     decoration: BoxDecoration(
            //         color: Colors.grey[900],
            //         borderRadius: BorderRadius.circular(5)
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.only(left: 8.0,right: 8.0),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text("Services",style: TextStyle(color: Colors.white)),
            //           Text("See All",style: TextStyle(color: Colors.white),),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Container(
            //   height: 120,
            //   padding: EdgeInsets.symmetric(vertical: 16),
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     padding: EdgeInsets.symmetric(horizontal: 16),
            //     itemCount: services.length,
            //     itemBuilder: (context, index) {
            //       return GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             _selectedCategory = index;
            //           });
            //         },
            //         child: Container(
            //           margin: EdgeInsets.only(right: 12),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Container(
            //                 padding: EdgeInsets.all(12),
            //                 decoration: BoxDecoration(
            //                   color: _selectedCategory == index
            //                       ? services[index].color
            //                       : services[index].color.withOpacity(0.1),
            //                   borderRadius: BorderRadius.circular(16),
            //                 ),
            //                 child: Icon(
            //                   services[index].icon,
            //                   color: _selectedCategory == index
            //                       ? Colors.white
            //                       : services[index].color,
            //                   size: 28,
            //                 ),
            //               ),
            //               SizedBox(height: 8),
            //               Text(
            //                 services[index].title.split(" ")[0],
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   color: _selectedCategory == index
            //                       ? services[index].color
            //                       : Colors.white,
            //                   fontSize: 12,
            //                   fontWeight: _selectedCategory == index
            //                       ? FontWeight.bold
            //                       : FontWeight.normal,
            //                 ),
            //                 overflow: TextOverflow.ellipsis,
            //               ),
            //             ],
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Expanded(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               services[_selectedCategory].title,
            //               style: TextStyle(
            //                 fontSize: 17,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.white,
            //               ),
            //             ),
            //             SizedBox(height: 4),
            //             Text(
            //               services[_selectedCategory].description,
            //               style: TextStyle(
            //                 fontSize: 12,
            //                 color: Colors.white,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       Container(
            //         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            //         decoration: BoxDecoration(
            //           color: services[_selectedCategory].color.withOpacity(0.1),
            //           borderRadius: BorderRadius.circular(20),
            //         ),
            //         child: Text(
            //           "${services[_selectedCategory].subServices.length} Services",
            //           style: TextStyle(
            //             color: services[_selectedCategory].color,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 12,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 16),
            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   padding: EdgeInsets.all(16),
            //   itemCount: services[_selectedCategory].subServices.length,
            //   itemBuilder: (context, index) {
            //     final subService = services[_selectedCategory].subServices[index];
            //     return Container(
            //       margin: EdgeInsets.only(bottom: 16),
            //       decoration: BoxDecoration(
            //         color: Colors.grey[900],
            //         borderRadius: BorderRadius.circular(16),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black.withOpacity(0.05),
            //             blurRadius: 10,
            //             offset: Offset(0, 4),
            //           ),
            //         ],
            //       ),
            //       child: Stack(
            //         children: [
            //           Padding(
            //             padding: EdgeInsets.all(16),
            //             child: Row(
            //               children: [
            //                 Container(
            //                   padding: EdgeInsets.all(12),
            //                   decoration: BoxDecoration(
            //                     color: services[_selectedCategory].color.withOpacity(0.1),
            //                     borderRadius: BorderRadius.circular(12),
            //                   ),
            //                   child: Icon(
            //                     subService.icon,
            //                     color: services[_selectedCategory].color,
            //                     size: 24,
            //                   ),
            //                 ),
            //                 SizedBox(width: 16),
            //                 Expanded(
            //                   child: Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Row(
            //                         children: [
            //                           Flexible(
            //                             child: Text(
            //                               subService.name,
            //                               style: TextStyle(
            //                                 fontSize: 16,
            //                                 fontWeight: FontWeight.bold,
            //                                 color: Colors.white,
            //                               ),
            //                               maxLines: 2,  // ← Prevent text overflow
            //                               overflow: TextOverflow.ellipsis,
            //                             ),
            //                           ),
            //                           if (subService.isPremium)
            //                             Padding(  // ← Better than Stack for simple cases
            //                               padding: EdgeInsets.only(left: 8),
            //                               child: Container(
            //                                 padding: EdgeInsets.symmetric(
            //                                   horizontal: 6,
            //                                   vertical: 2,
            //                                 ),
            //                                 decoration: BoxDecoration(
            //                                   color: Colors.amber.shade100,
            //                                   borderRadius: BorderRadius.circular(4),
            //                                 ),
            //                                 child: Text(
            //                                   "PREMIUM",
            //                                   style: TextStyle(
            //                                     fontSize: 10,
            //                                     fontWeight: FontWeight.bold,
            //                                     color: Colors.amber.shade800,
            //                                   ),
            //                                 ),
            //                               ),
            //                             )
            //                         ],
            //                       ),
            //                       SizedBox(height: 4),
            //                       Text(
            //                         subService.description,
            //                         style: TextStyle(
            //                           fontSize: 14,
            //                           color: Colors.white,
            //                         ),
            //                         maxLines: 2,  // ← Add text constraints
            //                         overflow: TextOverflow.ellipsis,
            //                       ),
            //                       if (subService.isPremium && subService.price != null)
            //                         Padding(
            //                           padding: EdgeInsets.only(top: 8),
            //                           child: Text(
            //                             "₹ ${subService.price!.toStringAsFixed(2)}",
            //                             style: TextStyle(
            //                               fontSize: 16,
            //                               fontWeight: FontWeight.bold,
            //                               color: services[_selectedCategory].color,
            //                             ),
            //                           ),
            //                         ),
            //                     ],
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //           Positioned(
            //             right: 16,
            //             bottom: 16,
            //             child: Container(
            //               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            //               decoration: BoxDecoration(
            //                 color: services[_selectedCategory].color,
            //                 borderRadius: BorderRadius.circular(20),
            //               ),
            //               child: Text(
            //                 subService.isPremium ? "Book Now" : "Select",
            //                 style: TextStyle(
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 12,
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}




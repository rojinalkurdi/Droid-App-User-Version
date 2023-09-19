import 'package:flutter/material.dart';
import 'package:gapp01/controller/product_details_controller.dart';
import 'package:gapp01/core/class/handling_data_view.dart';
import 'package:gapp01/core/constant/colors.dart';
import 'package:gapp01/core/constant/routes.dart';
import 'package:gapp01/view/widget/product/price_quantity.dart';
import 'package:gapp01/view/widget/product/top_product_page.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    return Scaffold(
      body: GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) => HandlingDataView(
              statusrequest: controller.statusrequest,
              widget: Container(
                padding: const EdgeInsets.all(15),
                child: ListView(
                  children: [
                    const TopProductPage(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.itemsModel.itemsName,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(color: Colors.black)),
                          const SizedBox(height: 10),
                          PriceAndQuantity(
                              //we want to add items to the cart through productDetails ui
                              //so we will inject cart's controller in productsDetails controller
                              //to achive this process
                              onAdd: () {
                                //adding in frontend
                                controller.add();
                              },
                              onRemove: () {
                                controller.remove();
                              },
                            price: "${controller.itemsModel.itemsDiscountedPrice}",
                             
                              quantity: "${controller.itemsCount}"),
                          const SizedBox(height: 10),
                          Text(controller.itemsModel.itemsDesc,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(fontSize: 15)),
                          const SizedBox(height: 10),
                          // mabda2eyyan 3ala ben ma e3mel el cart>>>>>>>>>>>
                          // Text("Colors", style:Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black)),
                          // const SizedBox(height: 10),
                          // SubitemsList(),
                        ],
                      ),
                    )
                  ],
                ),
              ))),
      //bottomNavigationbar is always only in the scaffold range.
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        height: 40,
        child: MaterialButton(
          onPressed: () {
            Get.toNamed(AppRoutes.cart);
          },
          color: AppColors.darkYellow,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Text("Add to cart",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: Colors.white)),
        ),
      ),
    );
  }
}

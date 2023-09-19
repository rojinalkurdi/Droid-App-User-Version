class AppLink {
  static const String server = "http://localhost:8012/gphp01";
  //static const String server = "sql303.infinityfree.com";
 // static const String images = "sql303.infinityfree.com/upload";
  static const String images = "http://localhost:8012/gphp01/upload";
  static const String test = "$server/test.php";

  //***************** SVG Images*****************************************************

  static const String categoriesImages = "$images/categories";
  static const String itemsImages = "$images/items";

  // **************** Auth_links*****************************************************

  static const String signup = "$server/auth/signup.php";
  static const String verifycode = "$server/auth/verifycode.php";
  static const String login = "$server/auth/login.php";

  // **************** ResetPassword_links**********************************************

  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String verifycodepw = "$server/forgetpassword/verifycodepw.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";

  //*****************Home****************************************** ******************

  static const String homepage = "$server/home.php";

  //******************Items********************************************************** */
  static const String items = "$server/items/items.php";
  static const String searchItems = "$server/items/search.php";

  //*****************Favorite********************************************** */
  
   static const String favoriteAdd = "$server/favorite/add.php";
   static const String favoriteRemove = "$server/favorite/remove.php";
   static const String favoriteView = "$server/favorite/view.php";
   static const String deleteFromMyfavorite = "$server/favorite/deleteFromMyfavorite.php";
  //*****************Cart ************************************************* */

  static const String cartAdd = "$server/cart/add.php";
  static const String cartDelete = "$server/cart/delete.php";
  static const String cartView = "$server/cart/view.php";
  static const String getitemscount = "$server/cart/getitemscount.php";

  //*****************Address*********************************************** */

  static const String addressAdd = "$server/address/add.php";
  static const String addressDelete = "$server/address/delete.php";
  static const String addressView = "$server/address/view.php";
  static const String addressEdit = "$server/address/edit.php";

  //*****************Coupon************************************************ */

  static const String checkCoupon = "$server/coupon/checkCoupon.php";

  //*****************Checkout********************************************* */  

  static const String checkout = "$server/orders/checkout.php";
  static const String pendingOrders = "$server/orders/pending.php";
  static const String archivedOrders = "$server/orders/archive.php";
  static const String ordersDetails = "$server/orders/details.php";
  static const String deleteOrder = "$server/orders/delete.php";

 
}

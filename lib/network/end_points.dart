/* 
  Modify:
    Modify by Thach
    Date: 5/3
    Content: Add new endPoint's blogPost
*/

class EndPoints {
  static const String baseUrl =
      'https://raw.githubusercontent.com/thanhhuy114/linhtinh/master';
  static const String devUrl = '';
  static const String login = '/api/basic/customer/customerLogin';
  static const String register = '/api/basic/customer/createCustomer';
  static const String orderDetail = '/order_detail.json';
  static const String menu = '/menu.json';
  static const String category = '/category.json';
  static const String menuArrival = '/menu_arrival.json';
  static const String footer = '/footer.json';
  static const String blogPost = '/blog_post_detail.json';
  static const String postMenu = '/posts_menu.json';
  static const String productDetail = '/product_detail.json';
  static const String productDetailLayout = '/product_detail_layout2.json';
  static const String drawer = '/drawer.json';
  static const String completeCheckout = '/complete_checkout.json';
  //Thach 11:45 6/3 endpoin collection get data collecion
  static const String collections = '/collections.json';
  static const String card = '/cards.json';
  static const String contactUs='/contact_us.json';
}

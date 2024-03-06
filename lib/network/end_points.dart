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
  
  static const String menuArrival = '/menu_arrival.json';
  static const String footer = '/footer.json';
  static const String blogPost = '/blog_post_detail.json';
  static const String postMenu = '/posts_menu.json';
}

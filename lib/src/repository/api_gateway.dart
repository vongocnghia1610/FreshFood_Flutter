class ApiGateway {
// Authentication
  static const LOGIN = 'user/login';
  static const REGISTER = 'user/register';

  static const READ = '/read';
  static const DELETE = '/read';

  //Group Product
  static const GETGROUPPRODUCT = 'groupProduct/getAllGroupProduct';

  //Cart
  static const GETCART = 'cart/getAllCart';
  static const ADD_TO_CART = 'cart/createCart';

  //product
  static const GET_DETAIL_PRODUCT = 'product/getDetailProduct';
  static const GET_RECOMMEND = 'product/findAllProduct';
  static const CREATE_PRODUCt = 'product/createProduct';

  //user
  static const GET_PROFILE = 'user/getInformation';
}

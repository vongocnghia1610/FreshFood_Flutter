class ApiGateway {
// Authentication
  static const LOGIN = 'user/login';
  static const REGISTER = 'user/register';
  static const FORGOTPASSWORD = 'user/forgotPassword';
  static const CONFIRMOTP = 'user/confirmOtp';
  static const CHANGEPASSWORDWITHOTP = 'user/changePasswordWithOtp';

  static const READ = '/read';
  static const DELETE = '/read';

  //Group Product
  static const GETGROUPPRODUCT = 'groupProduct/getAllGroupProduct';

  //Cart
  static const GETCART = 'cart/getAllCart';
  static const ADD_TO_CART = 'cart/createCart';
  static const UPDATE_CART = 'cart/updateCart';

  //product
  static const GET_DETAIL_PRODUCT = 'product/getDetailProduct';
  static const GET_RECOMMEND = 'product/findAllProduct';
  static const CREATE_PRODUCt = 'product/createProduct';
  static const GET_ALL_PRODUCT = 'product/findAllProduct';
  static const UPDATE_PRODUCT = 'product/updateProduct';

  //user
  static const GET_PROFILE = 'user/getInformation';
  static const UPDATE_IMAGE = 'user/updateImage';

  //address
  static const GET_ADDRESS = 'address/getAllAddress';
  static const ADD_ADDRESS = 'address/createAddress';
  static const UPDATE_ADDRESS = 'address/updateAddress';
  static const DELETE_ADDRESS = 'address/deleteAddress';
  //admin
  static const GET_ALL_USER = 'user/getAllUser';
  //eveluate
  static const GET_EVELUATE = 'eveluate/getEveluate';
}

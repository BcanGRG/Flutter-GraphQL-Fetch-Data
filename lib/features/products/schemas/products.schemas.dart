class ProductsSchemas {
  static String productQuery = """ 
    query {products(first:15,channel:"default-channel"){
  edges{
    node{
      id,
      name,
      thumbnail{
        url
      },
      productType{
        name
      },
    }
  }
}}
  """;
}

package Service;

import Model.Product;

import java.util.*;

public class ProductServiceImpl implements  ProductService {
    private static Map<Integer, Product> productList = new HashMap<>();
    static {
        productList.put(1, new Product(1, "IPhone",12000000, "Màu trắng","IPhone"));
        productList.put(2, new Product(2, "Oppo",10000000, "Màu xám","Oppo"));
        productList.put(3, new Product(3, "Sam sung",9000000, "Màu đen","Sam sung"));
        productList.put(4, new Product(4, "Galaxy",8000000, "Màu xanh","Sam sung"));
        productList.put(5, new Product(5, "Iphone X",12000000, "Màu hồng","IPhone"));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productList.values());
    }

    @Override
    public void save(Product product) {
        productList.put(product.getId(),product);

    }

    @Override
    public void update(int id, Product product) {
        productList.put(id,product);

    }

    @Override
    public void remove(int id) {
     productList.remove(id);

    }

    @Override
    public List<Product> searchByName(String name) {
        Set<Product> productSet = new HashSet(productList.values());
        List<Product> products = new ArrayList<>();
        for (Product product : productSet) {
            if (product.getName().contains(name)) {
                products.add(productList.get(product.getId()));
            }
        }
        return products;
    }

    @Override
    public Product findById(int id) {
        return productList.get(id);
    }
}

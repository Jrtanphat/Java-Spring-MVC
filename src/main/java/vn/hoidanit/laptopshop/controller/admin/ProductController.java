package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;

@Controller
public class ProductController {

    private final UploadService uploadService;
    private final ProductService productService;

    public ProductController(UploadService uploadService, ProductService productService) {
        this.uploadService = uploadService;
        this.productService = productService;
    }

    @GetMapping("/admin/product")
    public String getDashboard(Model model) {
        List<Product> products = this.productService.fetchProducts();
        model.addAttribute("products", products);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/{id}")
    public String getDetailProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.fetchProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("id", id);
        return "admin/product/productDetail";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        // truyen 2 tham so key va value
        return "admin/product/create";
        // vi java phai tra ve ten file moi co the mapping duoc vi tri
    }

    @PostMapping(value = "/admin/product/create")
    public String CreateProductPage(Model model, @ModelAttribute("newProduct") @Valid Product product,
            BindingResult newProductBindingResult,
            @RequestParam("imageFile") MultipartFile file) {
        // validate
        if (newProductBindingResult.hasErrors()) {
            // Để hiển thị lại form và báo lỗi
            return "admin/product/create"; // đúng tên view form của bạn
        }

        String image = this.uploadService.handleSaveUploadFile(file, "product");
        product.setImage(image);
        // save
        this.productService.createProduct(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Product currentProduct = this.productService.fetchProductById(id);
        model.addAttribute("newProduct", currentProduct);
        return "admin/product/updateProduct";
    }

    @PostMapping("/admin/product/update")
    public String updateUser(Model model, @ModelAttribute("newProduct") @Valid Product product,
            BindingResult newProductBindingResult,
            @RequestParam("imageFile") MultipartFile file) {

        // validate
        if (newProductBindingResult.hasErrors()) {
            return "admin/product/updateProduct";
        }
        Product currentProduct = this.productService.fetchProductById(product.getId());
        if (currentProduct != null) {
            if (!file.isEmpty()) {
                String img = this.uploadService.handleSaveUploadFile(file, "product");
                currentProduct.setImage(img);
            }
            currentProduct.setName(product.getName());
            currentProduct.setPrice(product.getPrice());
            currentProduct.setQuantity(product.getQuantity());
            currentProduct.setDetailDesc(product.getDetailDesc());
            currentProduct.setShortDesc(product.getShortDesc());
            currentProduct.setFactory(product.getFactory());
            currentProduct.setTarget(product.getTarget());
            System.out.println("Số lượng lỗi: " + newProductBindingResult.getErrorCount());
            this.productService.createProduct(currentProduct);
        }
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newProduct", new Product());
        return "admin/product/deleteProduct";
    }

    @PostMapping("/admin/product/delete")
    public String DeleteProductPage(Model model, @ModelAttribute("newProduct") Product product) {
        this.productService.deleteProduct(product.getId());
        return "redirect:/admin/product";
    }
}

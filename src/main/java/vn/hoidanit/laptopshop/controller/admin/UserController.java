package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;
import vn.hoidanit.laptopshop.domain.User;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;
import jakarta.validation.Valid;

// Mo hinh MVC
@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder PasswordEncoder;

    public UserController(
            UploadService uploadService, UserService userService, ServletContext servletContext,
            PasswordEncoder PasswordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.PasswordEncoder = PasswordEncoder;
    }

    // Bang table admin
    @RequestMapping("/admin/user")
    public String getTableUser(Model model) {
        List<User> users = this.userService.getAllUsers();
        System.out.println(">>> checkout user: " + users);
        model.addAttribute("users1", users);
        return "admin/user/show";
    }

    // Xem trang chi tiet user - su dung annotation moi la PathVariable de lay duoc
    // id dong cua user duoc tao ra
    @RequestMapping("/admin/user/{id}")
    public String getDetailUserPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/userDetail";
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        // truyen 2 tham so key va value
        return "admin/user/create";
        // vi java phai tra ve ten file moi co the mapping duoc vi tri
    }

    @PostMapping(value = "/admin/user/create")
    public String CreateUserPage(Model model, @ModelAttribute("newUser") @Valid User hoidanit,
            BindingResult newUserbindingResult,
            @RequestParam("imageFile") MultipartFile file) {

        List<FieldError> errors = newUserbindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>" + error.getField() + " - " + error.getDefaultMessage());
        }
        if (newUserbindingResult.hasErrors()) {
            // Để hiển thị lại form và báo lỗi
            return "admin/user/create"; // đúng tên view form của bạn
        }

        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.PasswordEncoder.encode(hoidanit.getPassword());

        hoidanit.setAvatar(avatar);
        hoidanit.setPassword(hashPassword);
        hoidanit.setRole(this.userService.getRoleByName(hoidanit.getRole().getName()));

        // save
        this.userService.handleSaveUser(hoidanit);
        return "redirect:/admin/user";
    }

    // logic : truyen tham so vao newUser, va ben form co modelAtrribute
    // newUser de co the dien vao voi cac path duoc gan theo cac thuoc tinh
    @RequestMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/updateUser";
    }

    @PostMapping("/admin/user/update")
    public String updateUser(Model model, @ModelAttribute("newUser") User user) {
        User currentUser = this.userService.getUserById(user.getId());
        if (currentUser != null) {
            currentUser.setAddress(user.getAddress());
            currentUser.setFullName(user.getFullName());
            currentUser.setPhone(user.getPhone());
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        // User user = new User();
        // user.setId(id);
        model.addAttribute("newUser", new User());
        return "admin/user/deleteUser";
    }

    @PostMapping("/admin/user/delete")
    public String DeleteUser(Model model, @ModelAttribute("newUser") User user) {
        this.userService.deleteAllUser(user.getId());
        return "redirect:/admin/user";
    }
}
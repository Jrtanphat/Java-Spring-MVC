package vn.hoidanit.laptopshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import vn.hoidanit.laptopshop.service.UserService;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.UserRepository;

import org.springframework.web.bind.annotation.RequestMethod;

// Mo hinh MVC
@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        String test = this.userService.handleHello();
        model.addAttribute("eric", "test");
        model.addAttribute("hoidanit", "from controller with model");
        // truyen 2 tham so key va value
        return "hello";
        // vi java phai tra ve ten file moi co the mapping duoc vi tri
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        model.addAttribute("newUser", new User());
        // truyen 2 tham so key va value
        return "admin/user/create";
        // vi java phai tra ve ten file moi co the mapping duoc vi tri
    }

    @RequestMapping(value = "/admin/user/create1", method = RequestMethod.POST)
    public String CreateUserPage(Model model, @ModelAttribute("newUser") User hoidanit) {
        // de lay duoc object cua form return ra
        // su dung annotation @ModelAttribute("Ten bien form da dat") + Kieu gia tri +
        // tenbien duoc gan vao
        System.out.println("run here " + hoidanit);
        this.userService.handleSaveUser(hoidanit);
        return "hello";
    }

}

// @RestController

// public class UserController {

// // DI : Dependency injection
// private UserService userService;

// public UserController(UserService userService) {
// this.userService = userService;
// }

// @GetMapping("")
// public String getHomePage() {
// return this.userService.handleHello();
// }
// }

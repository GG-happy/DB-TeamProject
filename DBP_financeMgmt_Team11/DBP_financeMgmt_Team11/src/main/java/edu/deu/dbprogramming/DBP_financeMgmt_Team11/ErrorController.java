package edu.deu.dbprogramming.DBP_financeMgmt_Team11;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {

    @GetMapping("/error")
    public String handleError() {
        return "error"; // `error.html` 템플릿을 반환
    }
}

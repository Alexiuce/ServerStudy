package provider.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.xml.crypto.KeySelector;

@RestController
public class HelloController {

    @Value("${server.port}")
    private String port;


    @RequestMapping("/hello")
    public String say(){
            return "Hello Controller";
    }

    @GetMapping("/index")
    public String index(){
        return "当前的端口是" + port;
    }
}

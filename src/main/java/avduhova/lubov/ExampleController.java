package avduhova.lubov;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ExampleController {

    @GetMapping("/")
    public String init() {
        return "Hello World! I'm alive!";
    }
}

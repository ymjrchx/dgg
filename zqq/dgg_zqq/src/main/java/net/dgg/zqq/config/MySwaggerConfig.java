package net.dgg.zqq.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @class_name: MySwaggerConfig
 **/
@EnableSwagger2
@Configuration
public class MySwaggerConfig {

    @Bean
    public Docket swaggerSpringfoxDocket() {
        ApiInfo apiInfo = new ApiInfoBuilder()
                .title("API列表")
                .description("API列表")
                .termsOfServiceUrl("https://zqq.dgg.net:9099/swagger-ui.html")
                //.contact("")
                .version("v1.0")
                .build();
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo)
                .select()
                .apis(RequestHandlerSelectors.basePackage("net.dgg.zqq"))
                .paths(PathSelectors.any())
                .build();
    }


}
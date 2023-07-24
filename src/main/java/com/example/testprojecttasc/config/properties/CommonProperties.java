package com.example.testprojecttasc.config.properties;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Data
@Configuration
public class CommonProperties {
    @Value("${application.common.default-page-size}")
    private Integer defaultPageSize;
    @Value("${application.common.default-page-number}")
    private Integer defaultPageNumber;
}

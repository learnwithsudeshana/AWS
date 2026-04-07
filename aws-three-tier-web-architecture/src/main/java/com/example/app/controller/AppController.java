package com.example.app.controller;

import com.example.app.service.DynamoService;
import com.example.app.service.S3Service;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/app")
public class AppController {

    private final S3Service s3Service;
    private final DynamoService dynamoService;

    public AppController(S3Service s3Service, DynamoService dynamoService) {
        this.s3Service = s3Service;
        this.dynamoService = dynamoService;
    }

    @PostMapping("/upload")
    public String uploadFile(@RequestParam("file") MultipartFile file) throws Exception {
        String bucketName = "my-s3-bucket";
        String key = file.getOriginalFilename();
        file.transferTo(java.nio.file.Paths.get("/tmp/" + key));
        s3Service.uploadFile(bucketName, key, "/tmp/" + key);
        return "File uploaded to S3 successfully!";
    }

    @PostMapping("/dynamo")
    public String saveToDynamo(@RequestParam String id, @RequestParam String value) {
        dynamoService.saveItem("MyDynamoTable", id, value);
        return "Item saved to DynamoDB successfully!";
    }
}
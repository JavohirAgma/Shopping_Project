package org.example.shoppingproject.utils;

import org.example.shoppingproject.model.Image;
import org.example.shoppingproject.service.ImageService;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.UUID;

public interface FileWriterUtil {
    ImageService imageService = new ImageService();

    static String write(String type, byte[] bytes) throws IOException {
        String BASE_PATH = "D:\\7-modul\\proyekt\\ShoppingProject\\src\\main\\resources\\docs";
        String uuid = UUID.randomUUID().toString();
        Path resolve = Path.of(BASE_PATH).resolve(uuid + type);
        Files.createFile(resolve);

        Files.write(resolve,bytes);
        return uuid;
    }


    static byte[] read(String uuid, String type) throws IOException {
        String BASE_PATH = "D:\\7-modul\\proyekt\\ShoppingProject\\src\\main\\resources\\docs";
        Path resolve = Path.of(BASE_PATH).resolve(uuid + type);
        byte[] bytes = Files.readAllBytes(resolve);
        return bytes;
    }
    static byte[] readAll() throws IOException {
        String BASE_PATH = "D:\\7-modul\\proyekt\\ShoppingProject\\src\\main\\resources\\docs";
        byte[] bytes=new byte[50];
        List<Image> all = imageService.getAll();
        for (Image image : all) {
            Path resolve = Path.of(BASE_PATH).resolve(image.getUuid() +image.getType());
            bytes= Files.readAllBytes(resolve);
        }

        return bytes;
    }


}
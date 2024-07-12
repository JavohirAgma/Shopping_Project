package org.example.shoppingproject.utils;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.UUID;

public interface FileWriterUtil {

    static String write(String type, byte[] bytes) throws IOException {
        String BASE_PATH = "/Users/xushnudxurramov/IdeaProjects/MyFirstWebApp/src/main/resources";
        String uuid = UUID.randomUUID().toString();
        Path resolve = Path.of(BASE_PATH).resolve(uuid + type);
        Files.createFile(resolve);

        Files.write(resolve,bytes);
        return uuid;
    }
    static byte[] read(String uuid, String type) throws IOException {
        String BASE_PATH = "/Users/xushnudxurramov/IdeaProjects/MyFirstWebApp/src/main/resources";

        Path resolve = Path.of(BASE_PATH).resolve(uuid + type);

        byte[] bytes = Files.readAllBytes(resolve);
        return bytes;
    }
}
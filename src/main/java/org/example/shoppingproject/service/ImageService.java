package org.example.shoppingproject.service;

import org.example.shoppingproject.model.Image;
import org.example.shoppingproject.model.Product;
import org.example.shoppingproject.repository.ImageRepository;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Base64;
import java.util.List;

public class ImageService {

    private ImageRepository imageRepository;


    public ImageService() {
        this.imageRepository = new ImageRepository();
    }

    public Integer save(Image image){
        return imageRepository.save(image);
    }

    public Image get(Integer id){
        return imageRepository.get(id);
    }
    public List<Image> getAll(){
        return imageRepository.getAll();
    }
    public Image getByProductId(Integer productId){
        return imageRepository.getByProductId(productId);
    }
    public String getWriter(Product product){
        try {
            Image image = getByProductId(product.getId());
            File file = new File("E:\\7 modul\\Shopping\\src\\main\\resources\\images\\"+image.getUuid()+image.getType());
            byte[] bytes = Files.readAllBytes(file.toPath());
            String s = Base64.getEncoder().encodeToString(bytes);
            BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter("base64.txt"));
            bufferedWriter.write(s);
            bufferedWriter.close();
            return s;
        }catch (IOException e){
            e.printStackTrace();
        }
        return null;
    }

}
package org.example.shoppingproject.service;

import org.example.shoppingproject.model.Image;
import org.example.shoppingproject.repository.ImageRepository;

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

}
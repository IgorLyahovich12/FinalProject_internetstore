package edu.lemon.internetstore.service;

import edu.lemon.internetstore.dao.FavoritesRepository;
import edu.lemon.internetstore.web.dto.FavoritesDTO;
import edu.lemon.internetstore.mapper.FavoritesMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FavoritesService {
    private final FavoritesRepository favoritesRepository;
    private final FavoritesMapper favoritesMapper;

    public FavoritesService(FavoritesRepository favoritesRepository, FavoritesMapper favoritesMapper) {
        this.favoritesRepository = favoritesRepository;
        this.favoritesMapper = favoritesMapper;
    }

    public List<FavoritesDTO> getFavorites() {
        return favoritesRepository.findAll().stream()
                .map(favoritesMapper::toDto)
                .toList();
    }
}

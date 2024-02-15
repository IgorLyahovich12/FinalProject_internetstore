package edu.lemon.internetstore.service;

import edu.lemon.internetstore.dao.BonusPointsRepository;
import edu.lemon.internetstore.web.dto.BonusPointsDTO;
import edu.lemon.internetstore.mapper.BonusPointsMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BonusPointsService {
    private  final BonusPointsRepository bonusPointsRepository;
    private final BonusPointsMapper bonusPointsMapper;


    public BonusPointsService(BonusPointsRepository bonusPointsRepository, BonusPointsMapper bonusPointsMapper) {
        this.bonusPointsRepository = bonusPointsRepository;
        this.bonusPointsMapper = bonusPointsMapper;
    }

    public List<BonusPointsDTO> getBonusPoints() {
        return bonusPointsRepository.findAll().stream()
                .map(bonusPointsMapper::toDto)
                .toList();
    }
}

package edu.lemon.internetstore.service;

import edu.lemon.internetstore.dao.ProvidersRepository;
import edu.lemon.internetstore.web.dto.ProvidersDTO;

import edu.lemon.internetstore.mapper.ProvidersMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProvidersService {
    private final ProvidersRepository providersRepository;
    private final ProvidersMapper providersMapper;

    public ProvidersService(ProvidersRepository providersRepository, ProvidersMapper providersMapper) {
        this.providersRepository = providersRepository;
        this.providersMapper = providersMapper;
    }

    public List<ProvidersDTO> getProvidersService() {
        return providersRepository.findAll().stream()
                .map(providersMapper::toDto)
                .toList();
    }
}

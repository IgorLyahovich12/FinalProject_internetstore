package edu.lemon.internetstore.web.dto;

import lombok.Builder;

import java.util.UUID;
@Builder
public record BonusPointsDTO (
        UUID bonus_points_id,
        int points

)
{
}

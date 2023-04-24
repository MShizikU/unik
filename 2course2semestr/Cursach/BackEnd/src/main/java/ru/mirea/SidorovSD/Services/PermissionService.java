package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Repos.PermissionRepo;

@Service
@Slf4j
public class PermissionService {

    private final PermissionRepo permissionRepo;

    public PermissionService(PermissionRepo permissionRepo) {
        this.permissionRepo = permissionRepo;
    }
}

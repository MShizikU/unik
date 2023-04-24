package ru.mirea.SidorovSD.Repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.SidorovSD.Models.Permission;

public interface PermissionRepo extends JpaRepository<Permission, Integer> {
}

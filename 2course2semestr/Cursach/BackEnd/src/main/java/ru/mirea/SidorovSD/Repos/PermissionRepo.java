package ru.mirea.SidorovSD.Repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.mirea.SidorovSD.Models.Permission;
import ru.mirea.SidorovSD.Services.PermissionService;

import java.util.List;

@RequestMapping
public interface PermissionRepo extends JpaRepository<Permission, Integer> {
    List<Permission> findByIdPermission(int idPermission);
    List<Permission> findByIdLevel(int idLevel);

    Permission findByIdLevelAndIdGroup(int idLevel, int idGroup);

    @Query(value = "DELETE FROM permission WHERE id_level = ?1 AND id_group = ?2", nativeQuery = true)
    void deleteByIdLevelAndIdGroup(int idLevel, int idGroup);

    List<Permission> findByIdGroup(int idGroup);
}

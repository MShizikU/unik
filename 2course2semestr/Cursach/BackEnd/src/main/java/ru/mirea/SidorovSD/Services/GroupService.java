package ru.mirea.SidorovSD.Services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import ru.mirea.SidorovSD.Repos.GroupRepo;

@Service
@Slf4j
public class GroupService {
    private final GroupRepo groupRepo;

    public GroupService(GroupRepo groupRepo) {
        this.groupRepo = groupRepo;
    }
}

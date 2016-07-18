package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.ActivityType;

@Repository
public interface ActivityTypeRepository extends
		JpaRepository<ActivityType, Integer> {

}

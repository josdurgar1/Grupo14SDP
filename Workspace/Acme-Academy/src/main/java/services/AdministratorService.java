package services;

import java.util.ArrayList;
import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.Group;
import domain.Lecturer;
import domain.Student;
import domain.Subject;

import repositories.AdministratorRepository;

@Service
@Transactional
public class AdministratorService {

	// Managed repository -----------------------------------------------------

	@Autowired
	AdministratorRepository administratorRepository;

	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------

	public AdministratorService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	// Other business methods -------------------------------------------------

	public Double avgNumberOfStudentsPerSubject() {
		Double result;

		result = administratorRepository.avgNumberOfStudentsPerSubject();

		return result;
	}

	public Collection<String> studentRolesSubject() {
		Collection<Student> studentRolesSubject;
		Collection<String> studentRolesSubject2;
		
		studentRolesSubject=administratorRepository.studentsEnrolledMoreOrLessThan20PAvg();
		studentRolesSubject2= new ArrayList<String>();
				
		for (Student s:studentRolesSubject){
			studentRolesSubject2.add(s.getName());
		}
		
		return studentRolesSubject2;
	}

	public Double averageSubjectPerLecturer() {
		Double result;
		
		result=administratorRepository.avgSubjectsLecturerTeaches();
		
		return result;
	}

	public Collection<String> subjectTeachLecturer() {
		Collection<Lecturer> lecturers;
		Collection<String> result;
		
		result=new ArrayList<String>();
		lecturers=administratorRepository.lecturersTeachMoreORLessThan20PAvg();
		for(Lecturer l:lecturers){
			result.add(l.getName());
		}
		
		return result;
	}

	public Double averageStudentPerGroup() {
		Double averageStudentPerGroup;
		averageStudentPerGroup=administratorRepository.avgStudentsPerGroup();
		return averageStudentPerGroup;
	}

	public Collection<String> groupStudent() {
		Collection<Group> groupStudent;
		Collection<String> result;
		
		groupStudent=administratorRepository.groupsEnrolledMoreOrLessThan20PAvg();
		result=new ArrayList<String>();
		for(Group g:groupStudent){
			result.add(g.getName());
		}
		
		return result;
	}

	public Collection<String> lecturersUploadMoreLM() {
		Collection<Lecturer> lecturersUploadMoreLM;
		Collection<String> result;
		
		result=new ArrayList<String>();
		
		lecturersUploadMoreLM=administratorRepository.lecturersWhoUploadMoreLearningMaterials();
		for(Lecturer l:lecturersUploadMoreLM){
			result.add(l.getName());
		}
		return result;
	}

	public Double averageLearningMaterialPerGroup() {
		Double result;
		
		result=administratorRepository.avgLearningMaterialsPerGroup();
		return result;
	}

	public Collection<String> subjectMoreLMAvailable() {
		Collection<Subject> subjectMoreLMAvailable;
		Collection<String> result;
		
		result=new ArrayList<String>();
		subjectMoreLMAvailable=administratorRepository.subjectsWithMoreLearningMaterials();
		for(Subject s:subjectMoreLMAvailable){
			result.add(s.getTitle());
		}
		return result;
	}

	public Double averageSocialIdentitiesPerActor() {
		Double result;
		result=administratorRepository.avgSocialIdentitiesPerActor();
		return result;
	}
	
	

}

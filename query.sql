-- Запит 1. Вивести групи крові, і кількість людей з даною групою крові в таблиці patient.
select patient_blood_type, count(patient_blood_type)
from patient
group by patient_blood_type;

-- Запит 2. Вивести id, імена і дати записів пацієнтів, які були зроблені в 2022 році і назви клінік в яких вони знаходяться.
select patient.patient_id, patient_name, hospital_name, date_of_admission
from patient join patient_admission 
on patient.patient_id = patient_admission.patient_id
	left join hospital
	using (hospital_id)
	where EXTRACT(YEAR FROM date_of_admission) = 2022;
	
	

-- Запит 3. Вивести імена пацієнтів, імена їх особистих лікарів, та назви клінік в яких вони знаходяться.
select patient_name, doctor_name, hospital_name
from patient join patient_doctor
using (patient_id)
	join doctor
	using (doctor_id)
		join hospital
		using (hospital_id);
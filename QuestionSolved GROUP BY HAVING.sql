CREATE DATABASE hospital_db;

USE hospital_db;

CREATE TABLE hospital_patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    department VARCHAR(30),
    doctor_name VARCHAR(50),
    admission_date DATE,
    discharge_date DATE,
    diagnosis VARCHAR(50),
    bill_amount DECIMAL(10,2),
    payment_status VARCHAR(20)
);

INSERT INTO hospital_patients VALUES
(1, 'Rahul Sharma', 45, 'Male', 'Cardiology', 'Dr. Amit Patil', '2026-01-05', '2026-01-10', 'Heart Disease', 75000, 'Paid'),

(2, 'Priya Deshmukh', 32, 'Female', 'Orthopedics', 'Dr. Neha Joshi', '2026-01-07', '2026-01-12', 'Fracture', 45000, 'Paid'),

(3, 'Amit Kulkarni', 60, 'Male', 'Neurology', 'Dr. Raj Mehta', '2026-01-08', '2026-01-15', 'Migraine', 85000, 'Pending'),

(4, 'Sneha Patil', 28, 'Female', 'Pediatrics', 'Dr. Kavita Shah', '2026-01-10', '2026-01-13', 'Viral Fever', 18000, 'Paid'),

(5, 'Vikas Jadhav', 52, 'Male', 'Cardiology', 'Dr. Amit Patil', '2026-01-12', '2026-01-18', 'Heart Disease', 95000, 'Pending'),

(6, 'Pooja More', 35, 'Female', 'Gynecology', 'Dr. Anjali Rao', '2026-01-14', '2026-01-17', 'Pregnancy Care', 55000, 'Paid'),

(7, 'Suresh Pawar', 67, 'Male', 'Orthopedics', 'Dr. Neha Joshi', '2026-01-15', '2026-01-22', 'Knee Replacement', 125000, 'Pending'),

(8, 'Anita Singh', 41, 'Female', 'Neurology', 'Dr. Raj Mehta', '2026-01-16', '2026-01-20', 'Migraine', 65000, 'Paid'),

(9, 'Karan Gupta', 19, 'Male', 'General Medicine', 'Dr. Sanjay Rao', '2026-01-18', '2026-01-21', 'Dengue', 32000, 'Paid'),

(10, 'Meena Joshi', 55, 'Female', 'Cardiology', 'Dr. Amit Patil', '2026-01-20', '2026-01-27', 'Heart Disease', 110000, 'Pending'),

(11, 'Rohit Nair', 38, 'Male', 'General Medicine', 'Dr. Sanjay Rao', '2026-01-22', '2026-01-25', 'Diabetes', 25000, 'Paid'),

(12, 'Kavita Desai', 29, 'Female', 'Gynecology', 'Dr. Anjali Rao', '2026-01-23', '2026-01-28', 'Pregnancy Care', 68000, 'Pending'),

(13, 'Manoj Shinde', 72, 'Male', 'Orthopedics', 'Dr. Neha Joshi', '2026-01-25', '2026-02-02', 'Knee Replacement', 150000, 'Paid'),

(14, 'Riya Kapoor', 12, 'Female', 'Pediatrics', 'Dr. Kavita Shah', '2026-01-26', '2026-01-29', 'Viral Fever', 22000, 'Paid'),

(15, 'Ajay Verma', 48, 'Male', 'Neurology', 'Dr. Raj Mehta', '2026-01-28', '2026-02-03', 'Stroke', 135000, 'Pending'),

(16, 'Neha Chavan', 33, 'Female', 'General Medicine', 'Dr. Sanjay Rao', '2026-02-01', '2026-02-05', 'Diabetes', 28000, 'Paid'),

(17, 'Sachin Yadav', 58, 'Male', 'Cardiology', 'Dr. Amit Patil', '2026-02-03', '2026-02-09', 'Heart Disease', 90000, 'Paid'),

(18, 'Swati Pawar', 26, 'Female', 'Gynecology', 'Dr. Anjali Rao', '2026-02-05', '2026-02-10', 'Pregnancy Care', 72000, 'Pending'),

(19, 'Deepak Mishra', 64, 'Male', 'Orthopedics', 'Dr. Neha Joshi', '2026-02-07', '2026-02-14', 'Fracture', 80000, 'Paid'),

(20, 'Asha Kumari', 44, 'Female', 'General Medicine', 'Dr. Sanjay Rao', '2026-02-10', '2026-02-14', 'Dengue', 35000, 'Pending');

select * from hospital_patients;


/*1. Display the total bill amount for each department, showing only departments with a 
total bill greater than ₹200,000. Sort the results from highest to lowest bill amount.*/
SELECT department,
sum(bill_amount) as total_bill_amount
from hospital_patients
group by department
having total_bill_amount > 200000
order by total_bill_amount desc;


/*2. Find the average bill amount for each doctor. Display only doctors whose average 
bill is greater than ₹50,000. Sort by average bill in descending order.*/
SELECT doctor_name,
avg(bill_amount) as avg_bill_amount
from hospital_patients
group by doctor_name
having avg_bill_amount > 50000
order by avg_bill_amount desc;

/*3. Display the number of patients in each department. Show only departments having 
more than 2 patients. Sort by patient count in descending order.*/
SELECT department,
count(*) as total_patient
from hospital_patients
group by department
having total_patient > 2
order by total_patient desc;

/*4. Find the total number of patients treated by each doctor. Display only doctors
 who treated more than 3 patients. Sort by patient count in ascending order.*/
 SELECT doctor_name,
 count(*) as total_patient
 from hospital_patients
 group by doctor_name
 having total_patient > 3
 order by total_patient asc;
 
/*5. Display the total bill amount for each payment status. Sort by total bill 
amount from highest to lowest.*/
SELECT payment_status,
sum(bill_amount) as total_bill
from hospital_patients
group by payment_status
order by total_bill desc;

/*6. Find the average age of patients in each department. Display departments where
 average age is greater than 40. Sort by average age descending.*/
 SELECT department,
 avg(age) as Avg_age
 from hospital_patients
 group by department
 having Avg_age > 40
 order by Avg_age desc;
 
/*7. Display departments having more than 2 patients with the Pending payment status.
 Sort by number of pending patients descending.*/
 SELECT department,
 count(*) as pending_pay
 from hospital_patients
 where payment_status = "Pending"
 group by department
 having pending_pay > 1
 order by pending_pay desc;
 
 
/*8. Find the total bill amount for each diagnosis. Display diagnoses with total bills
 greater than ₹100,000. Sort by total bill descending.*/
 SELECT diagnosis,
 sum(bill_amount) as total_bill
 from hospital_patients
 group by diagnosis
 having total_bill > 100000
 order by total_bill desc;
 
/*9. Find the number of male and female patients in each department. Display only groups having
 more than 1 patient. Sort by patient count descending*/
 SELECT department,gender,
 count(*) as total_patient
 from hospital_patients
 group by department,gender
 having count(*) > 1 
 order by total_patient desc;
 
/*10. Display the total number of patients and average bill amount for each department. Show only
departments having more than 2 patients. Sort by average bill amount descending.*/
SELECT department,
count(*) as total_patient , avg(bill_amount)as avg_bill_amount
from hospital_patients
group by department
having total_patient > 2
order by avg_bill_amount desc;

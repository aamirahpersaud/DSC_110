The table defines the structure for storing the data of the patient. The patient_id provides a way to uniquely identify each patient, with the patient's full name, age, gender, and residency. This enables filtering by category. 

CREATE TABLE Patients (
    patient_id INTEGER PRIMARY KEY,   
    name TEXT NOT NULL,
    age INTEGER,
    gender TEXT,
    city TEXT
);

The sample records of the patients are then added into a table. This tests the queries and demonstrates analysis of the sample data in the table. 

INSERT INTO Patients (patient_id, name, age, gender, city) VALUES
(1, 'John Doe', 45, 'M', 'Boston'),
(2, 'Jane Smith', 32, 'F', 'Cambridge'),
(3, 'Mike Johnson', 58, 'M', 'Boston'),
(4, 'Sarah Williams', 41, 'F', 'Somerville'),
(5, 'David Brown', 29, 'M', 'Boston'),
(6, 'Emily Davis', 67, 'F', 'Cambridge');

-- Retrieve all columns and rows from Patients table
The columns and rows from the Patients Table are all retrieved, verifying that the inserts all worked correctly. 
SELECT * FROM Patients;

This stores the record of medical visits linked to patients according to what identifies the visitor, what links them to the patient, the date of the visit, the diagnosis given during the visit, and the cost of the visit. It enables specifically-based analyses. 
-- Create Visits table
CREATE TABLE Visits (
    visit_id INTEGER PRIMARY KEY,
    patient_id INTEGER,
    visit_date TEXT,
    diagnosis TEXT,
    cost REAL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

This adds the sample visit records. This demonstartes the joins and analysis across the entire table. 
-- Insert sample data into Visits
INSERT INTO Visits (visit_id, patient_id, visit_date, diagnosis, cost) VALUES
(101, 1, '2024-01-15', 'Hypertension', 150.00),
(102, 1, '2024-03-20', 'Diabetes', 200.00),
(103, 2, '2024-02-10', 'Flu', 100.00),
(104, 3, '2024-01-25', 'Hypertension', 150.00),
(105, 3, '2024-02-14', 'Back Pain', 180.00),
(106, 4, '2024-03-05', 'Diabetes', 200.00),
(108, 6, '2024-02-20', 'Arthritis', 220.00),
(109, 6, '2024-03-15', 'Hypertension', 150.00);

All the data visits are retrieved in order to validate the data insertions and inspect the the relations made. 
SELECT * from Visits;

This retrieves only the relevant records. 
select * from Patients;

This filters the rows to focus the analysis on a specific geographic subset/ 
--Specific rows/records
select * from Patients where city = 'Boston';

Solely analyzes female patients. 
--Now select records for only Female patients

This limits the output to relevant fields, improving readabiltity. 
--Specific fields
Select patient_id, name, age from Patients;

By only returning selected comments, this avoids unnecessary data retrievals typically in larger datasets. 
--Now select name and city from patients

This counts the total rows to measure the size of the entire dataset. 
--Single summary stats
--How many rows are there?
select count(*) from patients;

This evaluates the diversity of the dataset, counting the values to understand categories in data and the significance they hold. 
--How many distinct genders are there?
select count(distinct gender) from Patients;

Calculating the mean provides a general indicator of the demongraphic. 
--What is the average age?
select avg(age) from Patients;

Grouping rows by gender then calcultating the mean enables comparison between male and female patients. 
--Summarazing by another variable
select gender, avg(age)
from Patients
group by gender;

This quickly identifies lower and higher values of each group, numbering the columns. 
--sort/order by
select gender, avg(age)
from Patients
group by gender
order by 2 desc;

This combines related data from multiple tables, demonstrating where the identifications match to only return patients who have visits, analyzing the medical activity. 
--Joins
--inner join
SELECT 
    p.name,
    p.age,
    v.visit_date,
    v.diagnosis,
    v.cost
FROM Patients p
JOIN Visits v ON p.patient_id = v.patient_id;

This returns all patients, regardless of visit to ensure that all patients are included. 
--left join

SELECT 
    p.name,
    p.age,
    v.visit_date,
    v.diagnosis,
    v.cost
FROM Patients p
LEFT JOIN Visits v ON p.patient_id = v.patient_id;

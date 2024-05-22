START TRANSACTION;

-- Récupération des séjours du patient
SELECT * FROM stays WHERE user_id = 16;

-- Récupération des avis médicaux du patient
SELECT * FROM avis WHERE patient_id = 16;

-- Récupération des prescriptions du patient
SELECT * FROM prescriptions WHERE patient_id = 16;

-- Récupération des médicaments associés à chaque prescription
SELECT pd.* 
FROM prescription_drugs pd
JOIN prescriptions p ON pd.prescription_id = p.id
WHERE p.patient_id = 1;

COMMIT;

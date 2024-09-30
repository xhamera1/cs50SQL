SELECT schools.id, schools.name, expenditures.per_pupil_expenditure, graduation_rates.excluded
FROM schools
JOIN expenditures ON schools.district_id=expenditures.district_id
JOIN graduation_rates ON schools.id=graduation_rates.school_id
WHERE expenditures.per_pupil_expenditure > (
    SELECT AVG(per_pupil_expenditure) FROM expenditures)
AND graduation_rates.excluded > (
    SELECT AVG(excluded) FROM graduation_rates)
ORDER BY graduation_rates.excluded DESC, expenditures.per_pupil_expenditure DESC;

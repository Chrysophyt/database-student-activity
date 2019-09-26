/* office code*/
SELECT
    employees.firstName, employees.lastName, offices.city, offices.addressLine1
FROM
    employees INNER JOIN offices on (employees.officeCode=offices.officeCode);

SELECT
    employee.lastName, supervisor.lastName, offices.phone
FROM
    employees as employee 
    INNER JOIN employees as supervisor on (employee.reportsTo=supervisor.employeeNumber)
    INNER JOIN offices on (supervisor.officeCode=offices.officeCode);

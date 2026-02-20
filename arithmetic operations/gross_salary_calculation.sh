echo "GROSS SALARY OF EMPLOYEE CALCULATION"
echo

echo "Enter basic salary of employee:"
read b

# DA = 1.65%
DA=$(echo "scale=2; $b * 1.65 / 100" | bc)
echo "DA = $DA"

# HRA = 30%
HRA=$(echo "scale=2; $b * 30 / 100" | bc)
echo "HRA = $HRA"

# Gross Salary
GROSS=$(echo "scale=2; $b + $DA + $HRA" | bc)
echo "Gross salary of employee is: $GROSS rupees"

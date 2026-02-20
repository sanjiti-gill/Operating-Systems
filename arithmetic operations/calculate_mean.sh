echo "Calculate mean salary of 4 employees A, B, C, D"
echo

echo "Enter salary of employee A:"
read a

echo "Enter salary of employee B:"
read b

echo "Enter salary of employee C:"
read c

echo "Enter salary of employee D:"
read d

# Sum using bc (supports large numbers safely)
sum=$(echo "$a + $b + $c + $d" | bc)

# Mean = sum / 4
mean=$(echo "scale=2; $sum / 4" | bc)

echo "Mean salary of employees is: $mean rupees"

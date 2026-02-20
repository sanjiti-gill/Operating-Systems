echo "Enter a year:"
read year

if [ $((year % 400)) -eq 0 ] || { [ $((year % 4)) -eq 0 ] && [ $((year % 100)) -ne 0 ]; }
then
    echo "Leap year"
else
    echo "Not a leap year"
fi
echo " "

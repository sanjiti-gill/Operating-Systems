echo "Checking if entered number is even or odd"
echo "Enter a number:"
read num

if [ $((num % 2)) -eq 0 ]
then
    echo "Entered $num is even"
else
    echo "Entered $num is odd"
fi

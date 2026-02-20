echo "arithmetic operations"

read a
read b

echo "add = $(echo "$a + $b" | bc)"   # with bc
sum=$((a + b))                        # without bc
echo "sum = $sum"

echo "sub = $(echo "$a - $b" | bc)"
sub=$((a - b))
echo "sub = $sub"

echo "mul = $(echo "$a * $b" | bc)"
mul=$((a * b))
echo "mul = $mul"

echo "div = $(echo "$a / $b" | bc)"
div=$((a / b))
echo "div = $div"

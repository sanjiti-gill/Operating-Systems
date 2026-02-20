echo "AREA AND PERIMETER OF CIRCLE, SQUARE AND RECTANGLE"

# ---- Circle ----
echo "Enter radius of circle:"
read r

echo "Area of circle: $(echo "$r * $r * 3.14" | bc) sq.units"
echo "Perimeter of circle: $(echo "2 * 3.14 * $r" | bc) units"

echo

# ---- Square ----
echo "Enter side of square:"
read s

echo "Area of square: $(echo "$s * $s" | bc) sq.units"
echo "Perimeter of square: $(echo "4 * $s" | bc) units"

echo

# ---- Rectangle ----
echo "Enter length of rectangle:"
read l

echo "Enter breadth of rectangle:"
read b

echo "Area of rectangle: $(echo "$l * $b" | bc) sq.units"
echo "Perimeter of rectangle: $(echo "2 * ($l + $b)" | bc) units"

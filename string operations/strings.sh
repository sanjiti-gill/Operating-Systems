#checking equality
echo "1. CHECKING EQUALITY OF STRINGS"
echo "Enter string 1:"
read str1
echo "Enter string 2:"
read str2

if [ "$str1" = "$str2" ]; then
    echo "Strings are equal"
else
    echo "Strings are not equal"
fi
echo

# 2. Concatenation
echo "2. CONCATENATED STRING:"
result="$str1 $str2"
echo "$result"
echo

# 3. Length
echo "3. LENGTH OF STRING"
echo "Enter a string:"
read str3
echo "Length = ${#str3}"
echo

# 4. Odd position characters
echo "4. ODD POSITION CHARACTERS"
len=${#str3}
res=""
for ((i=0; i<len; i++)); do
    if ((i % 2 == 0)); then
        res="${res}${str3:i:1}"
    fi
done
echo "$res"
echo

# 5. Reverse + Palindrome
echo "5. REVERSE STRING / PALINDROME CHECK"
echo "Enter a string:"
read str4
rev=""
len=${#str4}

for ((i=len-1; i>=0; i--)); do
    rev="${rev}${str4:i:1}"
done

echo "Reversed string: $rev"

if [ "$str4" = "$rev" ]; then
    echo "Palindrome"
else
    echo "Not a palindrome"
fi
echo

# 6. Substring
echo "6. SUBSTRING EXTRACTION"
echo "Enter a string:"
read str5
echo "Enter start index:"
read start
echo "Enter length:"
read length

substring=${str5:start:length}
echo "Substring: $substring"

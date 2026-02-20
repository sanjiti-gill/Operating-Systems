echo "1. CREATE FILE"
echo "Enter the file name:"
read file
touch "$file"
echo "File $file created successfully"
echo

# 2. ENTER CONTENT
echo "2. ENTER CONTENT OF FILE"
echo "Enter contents of file:"
read str
echo "$str" >> "$file"
echo

# 3. DISPLAY CONTENT
echo "3. DISPLAY CONTENT"
cat "$file"
echo

# 4. COUNT LINES, WORDS, CHARACTERS
echo "4. FILE STATISTICS"
wc "$file"
echo

# 5. SORT CONTENT
echo "5. SORTED CONTENT"
sort "$file"
echo

# 6. LOWERCASE → UPPERCASE
echo "6. UPPERCASE CONTENT"
cat "$file" | tr '[:lower:]' '[:upper:]'
echo

# 7. RENAME FILE
echo "7. RENAME FILE"
echo "Enter new name:"
read new_file
mv "$file" "$new_file"
echo "File renamed to $new_file"
echo

# 8. DELETE FILE
echo "8. DELETE FILE"
echo "Enter file name to delete:"
read del_file
rm -f "$del_file"
echo "File $del_file deleted successfully"

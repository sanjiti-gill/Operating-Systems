echo "Enter account balance:"
read balance

echo "Enter withdrawal amount:"
read w

# Check sufficient balance
if [ $balance -lt $w ]; then
    echo "Insufficient balance"
else
    # Tax slabs
    if [ $w -lt 1500 ]; then
        tax=$(echo "scale=2; $w * 0.03" | bc)
    elif [ $w -lt 3000 ]; then
        tax=$(echo "scale=2; $w * 0.04" | bc)
    else
        tax=$(echo "scale=2; $w * 0.05" | bc)
    fi

    echo "Withdrawal Amount: $w"
    echo "Tax Deducted: $tax"
fi

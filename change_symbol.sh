SYMBOL=$(spt pb --status -f %s)

if [ "${SYMBOL}" == "▶" ]; then
	echo "⏸"
else
	echo "▶"
fi

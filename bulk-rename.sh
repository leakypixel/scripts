if [ ! -n "$1" ] || [ ! -n "$2" ] || [ ! -n "$3" ] || [ ! -n "$4" ]; then
  echo "Usage: bulk-rename.sh \$match_directory \$match_string \$replace_string \$with_string"
  exit
fi

match_directory=$1
match_string=$2
replace=$3
with=$4

files=$(find $match_directory -maxdepth 50 -type f -name "$match_string")

for file in $files; do
  renamed_file=$(echo "$file" | sed s/$replace/$with/g)
  mv $file $renamed_file
  echo "File: $file"
  echo "Renamed: $renamed_file"
done

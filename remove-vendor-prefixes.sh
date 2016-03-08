files=$(find . -name *.scss -type f)
vendor_prefixes="-moz- -webkit- -o- -ms-"
superseded_properties="box-shadow border-radius gradient linear-gradient filter"
bad_properties="filter"

for file in $files; do
  echo "Processing: $file"
  
  for ss_prop in $superseded_properties; do
    for v_pre in $vendor_prefixes; do
      sed -ni "/$v_pre$ss_prop/!p" $file
    done
  done
  
  for bad_prop in $bad_properties; do
    sed -ni "/$bad_prop/!p" $file
  done
done

files=( $files )
echo "Done, processed ${#files[@]} files."

history=${1:-1}
curl -sSL https://coinbase.com/api/v1/prices/historical | head -n $history | sed "s|^.*,|$|" | sed "s|\(\.[0-9]$\)|\10|"
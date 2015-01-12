print_expected_format() {
    echo "Expected format:"
    echo "$0 acct_ID"
}

if [[ $1 == "" ]]; then
    print_expected_format
    exit
else
    ht -a $1 -i > devices_all
fi

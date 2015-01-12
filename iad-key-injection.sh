print_expected_format() {
    echo "Expected format:"
    echo "$0 iad qe1"
}

print_invalid_options() {
    echo "Unable to find device with given datacenter and qex lab params..."
}

if [[ $1 == "" || $2 == "" ]]; then
    print_expected_format
    exit
else
    cat devices_all | grep Device | awk '{print $2" "$3}' > devices;
    deployment_node=$(cat devices | grep $1 | grep $2 | grep infra01 | awk '{print $1}')
fi
if [[ $deployment_node = "" ]]; then
    print_invalid_options
    exit
fi

pubkey=$(echo $(ht $deployment_node -s get-public-key.sh --sudo-make-me-a-sandwich) | sed 's/.*ssh-rsa/ssh-rsa/')

cat add-ssh-key.sh.template | sed "s:^pub_key=.*:pub_key=\"$pubkey\":" > $1-$2-add-ssh-key.sh

for i in `cat devices | awk '{print $1}'`; do
    ht $i -s $1-$2-add-ssh-key.sh --sudo-make-me-a-sandwich
done

rm $1-$2-add-ssh-key.sh

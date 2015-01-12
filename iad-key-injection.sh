print_expected_format() {
    echo "Expected format:"
    echo "$0 iad lab01"
}

# IAD Lab 01
if [[ $1 == "iad" && $2 == "lab01" ]]; then
    deployment_node="569037"
# IAD Lab 02
elif [[ $1 == "iad" && $2 == "lab02" ]]; then
    deployment_node="578078"
# Invalid Parameters
else
    print_expected_format
    exit
fi

pubkey=$(echo $(ht $deployment_node -s get-public-key.sh --sudo-make-me-a-sandwich) | sed 's/.*ssh-rsa/ssh-rsa/')

cat add-ssh-key.sh.template | sed "s:^pub_key=.*:pub_key=\"$pubkey\":" > $1-$2-add-ssh-key.sh

for i in `cat devices | awk '{print $1}'`; do
    ht $i -s $1-$2-add-ssh-key.sh --sudo-make-me-a-sandwich
done

rm $1-$2-add-ssh-key.sh

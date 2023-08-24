#/bin/bash

echo "API Simple HTTP Test"
echo "Waiting 15 seconds to Deploy Finish"
sleep 15

# Test: Redness
URL=https://api-service-jonathancsr.cloud.okteto.net/ready
STATUSCODE=$(curl -s -o /dev/null -w "%{http_code}" -X GET $URL -H  "accept: application/json")
if test $STATUSCODE != 200; then
    exit 1
    echo $URL " | HTTP Code: " $STATUSCODE " | Test Status Fail"
fi
echo $URL " | HTTP Code: " $STATUSCODE " | Test Status Pass"

# Test: Temperature Conversion 
URL=https://api-service-jonathancsr.cloud.okteto.net/celsius/10/fahrenheit
STATUSCODE=$(curl -s -o /dev/null -w "%{http_code}" -X GET $URL -H  "accept: application/json")
if test $STATUSCODE != 200; then
    exit 1
    echo $URL " | HTTP Code: " $STATUSCODE " | Test Status ail"
fi
echo $URL " | HTTP Code: " $STATUSCODE " | Test Status Pass"

URL=https://api-service-jonathancsr.cloud.okteto.net/fahrenheit/10/celsius
STATUSCODE=$(curl -s -o /dev/null -w "%{http_code}" -X GET $URL -H  "accept: application/json")
if test $STATUSCODE != 200; then
    exit 1
    echo $URL " | HTTP Code: " $STATUSCODE " | Test Status Fail"
fi
echo $URL " | HTTP Code: " $STATUSCODE " | Test Status Pass"

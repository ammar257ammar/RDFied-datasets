#!/bin/bash

DATASET_URL=https://api.staging.kit.cloud.douglasconnect.com/datasets/ab2bc1ee-99dc-4ddf-b1f9-9fdeb8a0f48c/versions/1/data

# Uncomment this line to always download the latest version:
# DATASET_URL=https://api.staging.kit.cloud.douglasconnect.com/datasets/ab2bc1ee-99dc-4ddf-b1f9-9fdeb8a0f48c/versions/latest/data

curl -XGET ${DATASET_URL} \
-H "Content-Type: application/json" \
-o data.json \
--data-binary @- <<EOF
{
  "columns": [],
  "condition": null,
  "includeAggregations": true,
  "aggregationFilters": [],
  "offset": 0,
  "limit": null,
  "orderBy": []
}
EOF

# docker contentful

## set config
add file .env with
```
    SPACE_ID=<your space id>
    MANAGEMENT_TOKEN=<your management token>
```

## build image
```
    docker build -t docker-contentful .
```

## list contenttypes
```
    docker container run \
        -it \
        --rm \
        --env-file .env \
        docker-contentful \
        bash -c 'contentful content-type list \
            --space-id $SPACE_ID \
            --management-token $MANAGEMENT_TOKEN'
```

## exporting

### export content types
```
    docker container run \
        -it \
        --rm \
        --env-file .env \
        -v $(pwd)/export:/home/node/export \
        docker-contentful \
        bash -c 'contentful space export \
            --space-id $SPACE_ID \
            --management-token $MANAGEMENT_TOKEN \
            --skip-content \
            --skip-roles \
            --content-file export.json \
            --export-dir /home/node/export'
```

### export types, content, roles, content-model
```
    docker container run \
        -it \
        --rm \
        --env-file .env \
        -v $(pwd)/export:/home/node/export \
        docker-contentful \
        bash -c 'contentful space export \
            --space-id $SPACE_ID \
            --management-token $MANAGEMENT_TOKEN \
            --content-file export.json \
            --export-dir /home/node/export'
```

### export types, content, roles, content-model and download content and assets
```
    docker container run \
        -it \
        --rm \
        --env-file .env \
        -v $(pwd)/export:/home/node/export \
        docker-contentful \
        bash -c 'contentful space export \
            --space-id $SPACE_ID \
            --management-token $MANAGEMENT_TOKEN \
            --download-assets \
            --content-file export.json \
            --export-dir /home/node/export'
```

## importing
```
    docker container run \
        -it \
        --rm \
        --env-file .env \
        -v $(pwd)/export:/home/node/export \
        docker-contentful \
        bash -c 'contentful space import \
            --space-id $SPACE_ID \
            --management-token $MANAGEMENT_TOKEN \
            --content-file /home/node/export/export.json'
```

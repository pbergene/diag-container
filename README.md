# diag-container
Container with useful tooling

## Usage

Apply one of the provided OpenShift templates to your namespace.

* `openshift.yml` - for a pod without a PVC attached
* `openshift-with-pvc.yml` - for a pod with a PVC attached

Both templates support several parameters; please see the templates for details.

## Postgres Example

```bash
$ oc process --local -p POSTGRES_DB_SECRET_NAME=SECRET_NAME -f https://raw.githubusercontent.com/app-sre/diag-container/master/openshift.yml  | oc apply -f -
$ oc rsh <pod>
$ psql
pqsl>
```

## Redis Example

```bash
$ oc process --local -p REDIS_SECRET_NAME=SECRET_NAME -f https://raw.githubusercontent.com/app-sre/diag-container/master/openshift.yml  | oc apply -f -
$ oc rsh <pod>
$ redis-cli -h $REDISCLI_HOST -p $REDISCLI_PORT --tls
redis>
```

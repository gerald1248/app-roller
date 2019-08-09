# app-roller

Scheduled job that triggers rolling (where available) deployments of applications older than a specified number of hours.

Two environment variables have to be set, `APPS` and `THRESHOLD_HOURS`.

Sample `APPS` value:
```
default:hello-world mynamespace:farewell-world
```
Here the namespaces are `default` and `mynamespace`, respectively. `hello-world` and `farewell-world` are the names of the deployments. Note that the pods' `app` label has to match the name of the deployment. (This is usually the case; here it is necessary for the CronJob object to complete its task.)

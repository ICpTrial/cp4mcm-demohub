#!/usr/bin/env bash

## Delete Dirty Pods

for var in ibm-common-services management-infarastructure-management open-cluster-management kube-system management-monitoring openshift-monitoring openshift-operator-lifecycle-manager
do 
 echo $var
 kubectl get pods -n $var  | grep "0/" | grep -v "Completed" | awk '{ print $1 }' | xargs kubectl -n $var  delete pods
done

oc delete route cp-console -n ibm-common-services

## Uninstall IM, ChatOps
rm -f cp4mcm-cleanup-utility.sh
wget https://raw.githubusercontent.com/IBM/cp4mcm-samples/master/scripts/cp4mcm-cleanup-utility.sh
chmod +x cp4mcm-cleanup-utility.sh
#./cp4mcm-cleanup-utility.sh --mode preUninstallCleanup --kubeconfigPath /home/ibmuser/.kube/config
./cp4mcm-cleanup-utility.sh --kubeconfigPath /home/ibmuser/.kube/config --mode customResourceCleanup --InfraVM
./cp4mcm-cleanup-utility.sh --kubeconfigPath /home/ibmuser/.kube/config --mode customResourceCleanup --InfraGRC
./cp4mcm-cleanup-utility.sh --kubeconfigPath /home/ibmuser/.kube/config --mode customResourceCleanup --IMInstall
./cp4mcm-cleanup-utility.sh --kubeconfigPath /home/ibmuser/.kube/config --mode customResourceCleanup --VMPolicyAnsible


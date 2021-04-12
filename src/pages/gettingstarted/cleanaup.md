## 環境のクリーンアップ

DTE環境払出し直後の環境は、 このハンズオンシナリオでは実施しないコンポーネントや、失敗したジョブの定義などが含まれています。  
これらをクリーンナップするためには、以下を実施ください。
1. デスクトップ上の緑色のターミナルをダブルクリック
1. cleanup-env.sh をダウンロードし実行権限を付与
1. OpenShift にログインした状態で、cleanup-env.sh を実行ください。

```
[ibmuser@admin ~]$ pwd
/home/ibmuser
[ibmuser@admin ~]$ wget https://raw.githubusercontent.com/ICpTrial/cp4mcm-demohub/master/cleanup-env.sh
--2021-04-12 03:35:27--  https://raw.githubusercontent.com/ICpTrial/cp4mcm-demohub/master/cleanup-env.sh
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 185.199.111.133, 185.199.108.133, 185.199.109.133, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|185.199.111.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 658 [text/plain]
Saving to: ‘cleanup-env.sh’

100%[======================================>] 658         --.-K/s   in 0s      

2021-04-12 03:35:28 (23.4 MB/s) - ‘cleanup-env.sh’ saved [658/658]
[ibmuser@admin ~]$ chmod +x cleanup-env.sh 
[ibmuser@admin ~]$ ./cleanup-env.sh 
ibm-common-services
error: resource(s) were provided, but no name, label selector, or --all flag specified
management-infarastructure-management
No resources found in management-infarastructure-management namespace.
error: resource(s) were provided, but no name, label selector, or --all flag specified
open-cluster-management
error: resource(s) were provided, but no name, label selector, or --all flag specified
kube-system
pod "sre-bastion-bastion-backend-deploy-79dd6bb44c-trjv6" deleted
（略）
```



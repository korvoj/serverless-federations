# Federated Architecture for Serverless Platforms Aimed at Transparent Execution in the Edge-Cloud Continuum

This repository contains the accompanying resources to the paper titled "Federated Architecture for Serverless Platforms Aimed at Transparent Execution in the Edge-Cloud Continuum", accepted for publication in the [International Journal of Cloud Computing (IJCC)](https://www.inderscience.com/jhome.php?jcode=ijcc).

It contains the necessary scripts and configuration to quickly get started with a Karmada central control plane which can then manage multiple federated Kubernetes clusters. Additionally, a spec for a Kubernetes `Runtime` resource is provided, allowing the execution of WebAssembly workloads in a Kubernetes cluster.

The steps to recreate the environment are as follows:

1. Deploy a new Kubernetes cluster acting as a central control plane in the federation using the `kubernetes/k3s-master-deployment.sh` and `kubernetes/k3s-worker-deployment.sh` scripts.
2. Deploy Karmada using the Helm values file in `karmada/karmada.values.yaml`. The chart's source code is available in `karmada/karmada-helm-chart`.
3. Deploy additional Kubernetes clusters in different infrastructures. Join the Kubernetes clusters to the central control plane using:

    ```bash
    kubectl karmada --kubeconfig ${KARMADA_KUBECONFIG} join ${MEMBER_CLUSTER_NAME} --cluster-kubeconfig=${MEMBER_CLUSTER_KUBECONFIG}
    ```

4. Create the necessary propagation policies using `kubernetes/n-body.propagationPolicy.yaml` and `kubernetes/spin.propagationPolicy.yaml` as examples.

To provide support for execution of WebAssembly workloads in the member clusters, follow the instructions available on [wasm-orchestration/wasm-orchestration-scripts](https://github.com/wasm-orchestration/wasm-orchestration-scripts), which are part of the accompanying material published for the [1] paper.

Depending on the network conditions and the required security level, full-mesh VPN connectivity can be established between the control plane and the member clusters or between distributed nodes part of the same cluster employing a wide topology. More information is available in [korvoj/vpn-performance](https://github.com/korvoj/vpn-performance), part of [2].

[1] Kjorveziroski, V., Filiposka, S. WebAssembly Orchestration in the Context of Serverless Computing. J Netw Syst Manage 31, 62 (2023). https://doi.org/10.1007/s10922-023-09753-0

[2] Kjorveziroski V, Bernad C, Gilly K, Filiposka S. Full-mesh VPN performance evaluation for a secure edge-cloud continuum. Softw: Pract Exper. 2024; 1-22. doi: 10.1002/spe.3329
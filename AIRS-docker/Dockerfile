FROM ubuntu:22.04

LABEL maintainer="platform-team"
ENV DEBIAN_FRONTEND=noninteractive \
    TERRAFORM_VERSION=1.8.5 \
    KUBECTL_VERSION=v1.30.0

# Consolidate all installations into a single RUN layer to minimize image bloat
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    unzip \
    git \
    python3 \
    python3-pip \
    ca-certificates \
    gnupg \
    apt-transport-https \
    lsb-release \
    # 1. Install Google Cloud CLI
    && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee /etc/apt/sources.list.d/google-cloud-sdk.list \
    && curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg \
    && apt-get update && apt-get install -y --no-install-recommends google-cloud-cli \
    # 2. Install Terraform
    && curl -fsSL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip \
    && unzip terraform.zip -d /usr/local/bin/ \
    # 3. Install kubectl
    && curl -fsSL https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    # 4. Install Helm
    && curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash \
    # 5. Aggressive Cleanup
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* terraform.zip /tmp/*

WORKDIR /workspace
CMD ["bash"]


FROM ubuntu:18.10
WORKDIR /app
ENV KUBE_VERSION=v1.12.0
EXPOSE 8080
RUN groupadd app && useradd -g app app && \
  chown app:app /app
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -qq install -y jq apt-transport-https wget curl gnupg
RUN wget -O /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl && \
  chmod +x /usr/local/bin/kubectl
COPY app-roller /usr/local/bin/app-roller
RUN chmod +x /usr/local/bin/app-roller
USER app
CMD ["app-roller"]

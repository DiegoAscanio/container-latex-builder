FROM amd64/ubuntu:24.04
MAINTAINER  Diego Ascânio Santos <ascanio@cefetmg.br>
RUN apt update && DEBIAN_FRONTEND="noninteractive" TZ="America/Sao_Paulo" apt install -y make latexmk texlive texlive-full texlive-lang-portuguese texlive-latex-extra texlive-publishers texlive-science texlive-xetex texlive-fonts-extra pandoc git

# Dependências mínimas para baixar/validar via HTTPS
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl \
 && rm -rf /var/lib/apt/lists/*

# Instala o Tectonic com o instalador oficial e coloca no PATH
# (usa um diretório temporário e limpa depois)
RUN set -eux; \
    workdir="$(mktemp -d)"; \
    cd "$workdir"; \
    curl --proto '=https' --tlsv1.2 -fsSLo install.sh https://drop-sh.fullyjustified.net; \
    sh install.sh; \
    install -m 0755 ./tectonic /usr/local/bin/tectonic; \
    cd /; \
    rm -rf "$workdir"

COPY compilar_trabalho.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/compilar_trabalho.sh
CMD ["/bin/bash"]

FROM amd64/ubuntu:focal
MAINTAINER  Diego Ascânio Santos <ascanio@cefetmg.br>
RUN apt update && DEBIAN_FRONTEND="noninteractive" TZ="America/Sao_Paulo" apt install -y make latexmk texlive texlive-lang-portuguese texlive-latex-extra texlive-publishers texlive-science texlive-xetex texlive-fonts-extra git
COPY compilar_trabalho.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/compilar_trabalho.sh
CMD ["/bin/bash"]
